<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Solicitud de Cita Médica</title>
</head>
<body>
    <%
        Connection con = null;
        PreparedStatement ps = null;
        
        String cedula = request.getParameter("cedula");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String fechaCitaString = request.getParameter("fecha");
        String motivo = request.getParameter("motivo");
        
        java.sql.Date fechaCita = java.sql.Date.valueOf(fechaCitaString);
        
        if (edad <= 0) {
            response.sendRedirect("error.jsp?msg=La edad debe ser un valor positivo");
            return;
        }
        
        String url = "jdbc:postgresql://localhost:5432/eps_curitas";
        String username = "postgres"; 
        String passwordDB = "SILVER";
        
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, username, passwordDB);

            String sql = "INSERT INTO cita_medica (cedula, nombre, apellido, edad, direccion, telefono, correo, fecha_cita, motivo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, cedula);
            ps.setString(2, nombre);
            ps.setString(3, apellido);
            ps.setInt(4, edad);
            ps.setString(5, direccion);
            ps.setString(6, telefono);
            ps.setString(7, correo);
            ps.setDate(8, fechaCita);
            ps.setString(9, motivo);
            ps.executeUpdate();

            response.sendRedirect("exito.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=Error de SQL: " + e.getMessage());
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=Error en la conversión de la edad");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=Error general: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
