<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro de Administrador</title>
</head>
<body>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eps_curitas", "postgres", "SILVER");
        
        String cedula = request.getParameter("cedula_admin");
        String nombre = request.getParameter("nombre_admin");
        String apellido = request.getParameter("apellido_admin");
        String cargo = request.getParameter("cargo_admin");
        String telefono = request.getParameter("telefono_admin");
        String correo = request.getParameter("correo_admin");
        String contrasena = request.getParameter("contrasena_admin");
        
        if (cedula == null || nombre == null || apellido == null || cargo == null || telefono == null || correo == null || contrasena == null) {
            throw new IllegalArgumentException("Todos los campos son obligatorios.");
        }
        
        String query = "INSERT INTO administrador (cedula, nombre, apellido, cargo, telefono, correo_electronico, contrasena) VALUES (?, ?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, cedula);
        stmt.setString(2, nombre);
        stmt.setString(3, apellido);
        stmt.setString(4, cargo);
        stmt.setString(5, telefono);
        stmt.setString(6, correo);
        stmt.setString(7, contrasena);
        stmt.executeUpdate();
        
        response.sendRedirect("exito.jsp");
    } catch (SQLException e) {
        out.println("Error SQL: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Error de clase: " + e.getMessage());
    } catch (IllegalArgumentException e) {
        out.println("Error: " + e.getMessage());
    } catch (Exception e) {
        out.println("Error desconocido: " + e.getMessage());
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
