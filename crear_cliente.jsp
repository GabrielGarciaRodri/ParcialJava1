<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Cliente</title>
</head>
<body>
    <%
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String cedulaCliente = request.getParameter("cedulaCliente");
        String nombreCliente = request.getParameter("nombreCliente");
        String apellidoCliente = request.getParameter("apellidoCliente");
        String edadCliente = request.getParameter("edadCliente");
        String direccionCliente = request.getParameter("direccionCliente");
        String telefonoCliente = request.getParameter("telefonoCliente");
        String correoCliente = request.getParameter("correoCliente");
        String contrasenaCliente = request.getParameter("contrasenaCliente");

        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/eps_curitas";
            String usuario = "postgres";
            String contrasena = "SILVER";
            connection = DriverManager.getConnection(url, usuario, contrasena);

            String query = "INSERT INTO cliente (cedula, nombre, apellido, edad, direccion, telefono, correo_electronico, contrasena) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, cedulaCliente);
            preparedStatement.setString(2, nombreCliente);
            preparedStatement.setString(3, apellidoCliente);
            preparedStatement.setInt(4, Integer.parseInt(edadCliente));
            preparedStatement.setString(5, direccionCliente);
            preparedStatement.setString(6, telefonoCliente);
            preparedStatement.setString(7, correoCliente);
            preparedStatement.setString(8, contrasenaCliente);
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
