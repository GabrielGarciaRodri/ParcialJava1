<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Cliente</title>
    <link rel="stylesheet" href="css/actualizar_cliente.css">
</head>
<body>
    <div class="container">
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

                String query = "UPDATE cliente SET nombre=?, apellido=?, edad=?, direccion=?, telefono=?, correo_electronico=?, contrasena=? WHERE cedula=?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, nombreCliente);
                preparedStatement.setString(2, apellidoCliente);
                preparedStatement.setInt(3, Integer.parseInt(edadCliente));
                preparedStatement.setString(4, direccionCliente);
                preparedStatement.setString(5, telefonoCliente);
                preparedStatement.setString(6, correoCliente);
                preparedStatement.setString(7, contrasenaCliente);
                preparedStatement.setString(8, cedulaCliente);

                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
        %>
                <h2 class="success">Cliente actualizado correctamente</h2>
        <%
                } else {
        %>
                <h2 class="error">Error al actualizar el cliente</h2>
        <%
                }
            } catch (ClassNotFoundException | SQLException e) {
        %>
                <h2 class="error">Error: <%= e.getMessage() %></h2>
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
        %>
                    <h2 class="error">Error al cerrar la conexión: <%= e.getMessage() %></h2>
        <%
                }
            }
        %>
         <a href="actualizar_datos_personales.jsp" class="back-link">Regresar</a>
    </div>
    
</body>
</html>
