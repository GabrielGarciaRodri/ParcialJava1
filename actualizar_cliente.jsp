<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Cliente</title>
    <link rel="stylesheet" href="css/modificar_cliente.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
</head>
<body>
    <div class="container">
        <%
            Connection connection = null;
            PreparedStatement preparedStatement = null;

            String cedulaCliente = request.getParameter("cedulaCliente");
            String nombreCliente = request.getParameter("nombreCliente");
            String apellidoCliente = request.getParameter("apellidoCliente");
            int edadCliente = Integer.parseInt(request.getParameter("edadCliente"));
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

                String query = "UPDATE cliente SET nombre=?, apellido=?, edad=?, direccion=?, telefono=?, correo_electronico=?, contrasena=? WHERE cedula=?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, nombreCliente);
                preparedStatement.setString(2, apellidoCliente);
                preparedStatement.setInt(3, edadCliente);
                preparedStatement.setString(4, direccionCliente);
                preparedStatement.setString(5, telefonoCliente);
                preparedStatement.setString(6, correoCliente);
                preparedStatement.setString(7, contrasenaCliente);
                preparedStatement.setString(8, cedulaCliente);

                int filasActualizadas = preparedStatement.executeUpdate();

                if (filasActualizadas > 0) {
        %>
        <h2>Cliente Actualizado</h2>
        <p>Los datos del cliente han sido actualizados correctamente.</p>
        <%
                } else {
        %>
        <h2>Error al Actualizar</h2>
        <p>No se pudo actualizar los datos del cliente. Por favor, inténtelo de nuevo.</p>
        <%
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (preparedStatement != null) {
                        preparedStatement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    out.println("<p class='error'>Error al cerrar la conexión: " + e.getMessage() + "</p>");
                }
            }
        %>
        <div style="margin-top: 20px;">
            <a href="administrador.jsp" class="back-link">Regresar</a>
        </div>
    </div>
</body>
</html>
