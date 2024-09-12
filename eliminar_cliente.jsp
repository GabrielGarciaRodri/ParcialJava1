<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eliminar Cliente</title>
</head>
<body>
<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String cedulaCliente = request.getParameter("cedulaClienteEliminar");
    
    try {
        Class.forName("org.postgresql.Driver");
        
        String url = "jdbc:postgresql://localhost:5432/eps_curitas";
        String usuario = "postgres";
        String contrasena = "SILVER";
        connection = DriverManager.getConnection(url, usuario, contrasena);
        
        String query = "DELETE FROM cliente WHERE cedula = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, cedulaCliente);
        int rowsAffected = preparedStatement.executeUpdate();
        
        if (rowsAffected > 0) {
            response.sendRedirect("exito.jsp");
        } else {
            out.println("No se encontró ningún cliente con la cédula: " + cedulaCliente + ".");
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
