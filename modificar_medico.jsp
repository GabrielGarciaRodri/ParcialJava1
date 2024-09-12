<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Médico</title>
    <link rel="stylesheet" href="css/modificar_medico.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
</head>
<body>
    <div class="container">
        <%
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            String cedulaMedico = request.getParameter("cedulaMedicoMod");

            try {
                Class.forName("org.postgresql.Driver");
                String url = "jdbc:postgresql://localhost:5432/eps_curitas";
                String usuario = "postgres";
                String contrasena = "SILVER";
                connection = DriverManager.getConnection(url, usuario, contrasena);

                String query = "SELECT * FROM medico WHERE cedula=?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, cedulaMedico);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    String nombreMedico = resultSet.getString("nombre");
                    String apellidoMedico = resultSet.getString("apellido");
                    String especialidadMedico = resultSet.getString("especialidad");
                    String telefonoMedico = resultSet.getString("telefono");
                    String correoMedico = resultSet.getString("correo_electronico");
        %>

        <h2>Modificar Médico</h2>
        <form action="actualizar_medico.jsp" method="post">
            <input type="hidden" name="cedulaMedico" value="<%= cedulaMedico %>">
            <div>
                <label for="nombreMedico">Nombre</label>
                <input type="text" id="nombreMedico" name="nombreMedico" value="<%= nombreMedico %>" required>
            </div>
            <div>
                <label for="apellidoMedico">Apellido</label>
                <input type="text" id="apellidoMedico" name="apellidoMedico" value="<%= apellidoMedico %>" required>
            </div>
            <div>
                <label for="especialidadMedico">Especialidad</label>
                <input type="text" id="especialidadMedico" name="especialidadMedico" value="<%= especialidadMedico %>" required>
            </div>
            <div>
                <label for="telefonoMedico">Teléfono</label>
                <input type="text" id="telefonoMedico" name="telefonoMedico" value="<%= telefonoMedico %>" required>
            </div>
            <div>
                <label for="correoMedico">Correo Electrónico</label>
                <input type="email" id="correoMedico" name="correoMedico" value="<%= correoMedico %>" required>
            </div>
            <button type="submit">Actualizar Médico</button>
        </form>

        <%
                    } else {
                        out.println("<p class='error-message'>Médico no encontrado.</p>");
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
            <a href="administrador.jsp" class="back-link">Regresar</a>
        </div>
    </div>
</body>
</html>
