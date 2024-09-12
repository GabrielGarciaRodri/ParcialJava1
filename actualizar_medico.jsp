<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Médico</title>
    <link rel="stylesheet" href="css/modificar_medico.css">
</head>
<body>
    <div class="container">
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

                String query = "UPDATE medico SET nombre=?, apellido=?, especialidad=?, telefono=?, correo_electronico=? WHERE cedula=?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, nombreMedico);
                preparedStatement.setString(2, apellidoMedico);
                preparedStatement.setString(3, especialidadMedico);
                preparedStatement.setString(4, telefonoMedico);
                preparedStatement.setString(5, correoMedico);
                preparedStatement.setString(6, cedulaMedico);

                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
        %>
        <h2>Información de Médico Actualizada</h2>
        <p>Los datos del médico han sido actualizados exitosamente.</p>
        <%
                } else {
        %>
        <h2>Error al Actualizar Información</h2>
        <p>No se pudo actualizar la información del médico. Por favor, inténtalo de nuevo.</p>
        <%
                }
            } catch (ClassNotFoundException | SQLException e) {
        %>
        <h2>Error al Actualizar Información</h2>
        <p>Ocurrió un error durante el proceso de actualización: <%= e.getMessage() %></p>
        <%
            } finally {
                try {
                    if (preparedStatement != null) {
                        preparedStatement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    out.println("<p>Error al cerrar la conexión: " + e.getMessage() + "</p>");
                }
            }
        %>
        <div style="margin-top: 20px;">
            <a href="administrador.jsp" class="back-link">Regresar</a>
        </div>
    </div>
</body>
</html>
