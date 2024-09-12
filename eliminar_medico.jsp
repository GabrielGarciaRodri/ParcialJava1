<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eliminar Medico</title>
</head>
<body>
<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String cedulaMedico = request.getParameter("cedulaMedicoEliminar");
    
    try {

        Class.forName("org.postgresql.Driver");
        

        String url = "jdbc:postgresql://localhost:5432/eps_curitas";
        String usuario = "postgres";
        String contrasena = "SILVER";
        connection = DriverManager.getConnection(url, usuario, contrasena);
        
        String query = "DELETE FROM medico WHERE cedula = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, cedulaMedico);
        int rowsAffected = preparedStatement.executeUpdate();
        
        if (rowsAffected > 0) {
            response.sendRedirect("exito.jsp");
        } else {
            out.println("No se encontró ningún médico con la cédula: " + cedulaMedico + ".");
        }
    } catch (ClassNotFoundException | SQLException e) {
        response.sendRedirect("error.jsp");
    } finally {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
%>
</body>
</html>
