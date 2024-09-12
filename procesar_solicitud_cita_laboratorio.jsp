<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String cedula = request.getParameter("cedula");
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
int edad = Integer.parseInt(request.getParameter("edad"));
String direccion = request.getParameter("direccion");
String telefono = request.getParameter("telefono");
String correo = request.getParameter("correo_electronico");
String fechaCitaString = request.getParameter("fecha");
String tipoPrueba = request.getParameter("tipo_prueba");

java.sql.Date fechaCita = java.sql.Date.valueOf(fechaCitaString);

String url = "jdbc:postgresql://localhost:5432/eps_curitas";
String usuario = "postgres";
String contraseña = "SILVER";

try {
    Class.forName("org.postgresql.Driver");
    Connection conexion = DriverManager.getConnection(url, usuario, contraseña);
    
    String sql = "INSERT INTO cita_laboratorio (cedula, nombre, apellido, edad, direccion, telefono, correo_electronico, fecha_cita, tipo_prueba) " +
                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    PreparedStatement statement = conexion.prepareStatement(sql);
    statement.setString(1, cedula);
    statement.setString(2, nombre);
    statement.setString(3, apellido);
    statement.setInt(4, edad);
    statement.setString(5, direccion);
    statement.setString(6, telefono);
    statement.setString(7, correo);
    statement.setDate(8, fechaCita);
    statement.setString(9, tipoPrueba);
    
    int filasInsertadas = statement.executeUpdate();
    
    statement.close();
    conexion.close();
    
    response.sendRedirect("exito.jsp");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("error.jsp");
}
%>
