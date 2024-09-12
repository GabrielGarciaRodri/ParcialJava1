<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Médico</title>
</head>
<body>
    <%
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String cedulaMedico = request.getParameter("cedulaMedico");
        String nombreMedico = request.getParameter("nombreMedico");
        String apellidoMedico = request.getParameter("apellidoMedico");
        String especialidadMedico = request.getParameter("especialidadMedico");
        String telefonoMedico = request.getParameter("telefonoMedico");
        String correoMedico = request.getParameter("correoMedico");

        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/eps_curitas";
            String usuario = "postgres";
            String contrasena = "SILVER";
            connection = DriverManager.getConnection(url, usuario, contrasena);

            String query = "INSERT INTO medico (cedula, nombre, apellido, especialidad, telefono, correo_electronico) VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, cedulaMedico);
            preparedStatement.setString(2, nombreMedico);
            preparedStatement.setString(3, apellidoMedico);
            preparedStatement.setString(4, especialidadMedico);
            preparedStatement.setString(5, telefonoMedico);
            preparedStatement.setString(6, correoMedico);
            preparedStatement.executeUpdate();

            response.sendRedirect("exito.jsp");
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
