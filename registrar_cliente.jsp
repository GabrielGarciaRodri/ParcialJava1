<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro de Cliente</title>
</head>
<body>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eps_curitas", "postgres", "SILVER");
        
        String cedula = request.getParameter("cedula");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edadStr = request.getParameter("edad");
        int edad = 0;
        if (edadStr != null && !edadStr.isEmpty()) {
            try {
                edad = Integer.parseInt(edadStr);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("La edad debe ser un número entero válido.");
            }
        }
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        
        if (cedula == null || nombre == null || apellido == null || direccion == null || telefono == null || correo == null || contrasena == null) {
            throw new IllegalArgumentException("Todos los campos son obligatorios.");
        }
        
        String query = "INSERT INTO cliente (cedula, nombre, apellido, edad, direccion, telefono, correo_electronico, contrasena) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, cedula);
        stmt.setString(2, nombre);
        stmt.setString(3, apellido);
        stmt.setInt(4, edad);
        stmt.setString(5, direccion);
        stmt.setString(6, telefono);
        stmt.setString(7, correo);
        stmt.setString(8, contrasena);
        stmt.executeUpdate();
        
        response.sendRedirect("exito.jsp");
    } catch (SQLException | ClassNotFoundException e) {
        out.println("Error: " + e.getMessage());
    } catch (IllegalArgumentException e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
%>
</body>
</html>
