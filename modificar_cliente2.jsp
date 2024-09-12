<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Cliente</title>
    <link rel="stylesheet" href="css/modificar_cliente.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
</head>
<body>
    <div class="container">
        <%
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            String cedulaCliente = request.getParameter("cedulaClienteMod");

            try {
                Class.forName("org.postgresql.Driver");
                String url = "jdbc:postgresql://localhost:5432/eps_curitas";
                String usuario = "postgres";
                String contrasena = "SILVER";
                connection = DriverManager.getConnection(url, usuario, contrasena);

                String query = "SELECT * FROM cliente WHERE cedula=?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, cedulaCliente);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    String nombreCliente = resultSet.getString("nombre");
                    String apellidoCliente = resultSet.getString("apellido");
                    int edadCliente = resultSet.getInt("edad");
                    String direccionCliente = resultSet.getString("direccion");
                    String telefonoCliente = resultSet.getString("telefono");
                    String correoCliente = resultSet.getString("correo_electronico");
                    String contrasenaCliente = resultSet.getString("contrasena");
        %>

        <h2>Modificar Cliente</h2>
        <form action="actualizar_cliente2.jsp" method="post">
            <input type="hidden" name="cedulaCliente" value="<%= cedulaCliente %>">
            <div>
                <label for="nombreCliente">Nombre</label>
                <input type="text" id="nombreCliente" name="nombreCliente" value="<%= nombreCliente %>" required>
            </div>
            <div>
                <label for="apellidoCliente">Apellido</label>
                <input type="text" id="apellidoCliente" name="apellidoCliente" value="<%= apellidoCliente %>" required>
            </div>
            <div>
                <label for="edadCliente">Edad</label>
                <input type="number" id="edadCliente" name="edadCliente" value="<%= edadCliente %>" required>
            </div>
            <div>
                <label for="direccionCliente">Dirección</label>
                <input type="text" id="direccionCliente" name="direccionCliente" value="<%= direccionCliente %>" required>
            </div>
            <div>
                <label for="telefonoCliente">Teléfono</label>
                <input type="text" id="telefonoCliente" name="telefonoCliente" value="<%= telefonoCliente %>" required>
            </div>
            <div>
                <label for="correoCliente">Correo Electrónico</label>
                <input type="email" id="correoCliente" name="correoCliente" value="<%= correoCliente %>" required>
            </div>
            <div>
                <label for="contrasenaCliente">Contraseña</label>
                <input type="password" id="contrasenaCliente" name="contrasenaCliente" value="<%= contrasenaCliente %>" required>
            </div>
            <button type="submit">Actualizar Cliente</button>
        </form>

        <%
                } else {
                    out.println("<p class='error'>Cliente no encontrado.</p>");
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
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
            <a href="actualizar_datos_personales.jsp" class="back-link">Regresar</a>
        </div>
    </div>
</body>
</html>
