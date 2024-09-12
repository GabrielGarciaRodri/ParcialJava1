<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Datos Personales</title>
    <link rel="stylesheet" href="css/procesar_actualizacion_datos_personales.css">
</head>
<body>
    <div class="container">
        <h2>Actualizar Datos Personales</h2>
        <%
            String cedula = request.getParameter("cedula");

            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eps_curitas", "postgres", "SILVER");

                String sql = "SELECT * FROM cliente WHERE cedula=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, cedula);
                rs = ps.executeQuery();

                if (rs.next()) {
        %>
        <form action="procesar_actualizacion_datos_personales.jsp" method="post">
            <input type="hidden" name="cedula" value="<%= rs.getString("cedula") %>">
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" value="<%= rs.getString("nombre") %>" required>

            <label for="apellido">Apellido</label>
            <input type="text" id="apellido" name="apellido" value="<%= rs.getString("apellido") %>" required>

            <label for="edad">Edad</label>
            <input type="number" id="edad" name="edad" value="<%= rs.getInt("edad") %>" required>

            <label for="direccion">Dirección</label>
            <input type="text" id="direccion" name="direccion" value="<%= rs.getString("direccion") %>" required>

            <label for="telefono">Teléfono</label>
            <input type="tel" id="telefono" name="telefono" value="<%= rs.getString("telefono") %>" required>

            <label for="correo">Correo Electrónico</label>
            <input type="email" id="correo" name="correo" value="<%= rs.getString("correo_electronico") %>" required>

            <label for="contrasena">Contraseña</label>
            <input type="password" id="contrasena" name="contrasena" value="<%= rs.getString("contrasena") %>" required>

            <button type="submit">Actualizar</button>
        </form>
        <% 
                } else {
                    response.sendRedirect("error.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        <a href="cliente.jsp" class="btn btn-regresar mt-3">Regresar</a>
    </div>
</body>
</html>
