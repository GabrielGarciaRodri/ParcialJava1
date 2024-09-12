<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Actualizar Administrador</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
</head>
<body style="font-family: Arial, sans-serif; background-color: #f8f9fa; padding: 20px;">
    <div style="margin: 0 auto; max-width: 600px;">
        <%
        String cedula = request.getParameter("cedula_admin");
        String nombre = request.getParameter("nombre_admin");
        String apellido = request.getParameter("apellido_admin");
        String cargo = request.getParameter("cargo_admin");
        String telefono = request.getParameter("telefono_admin");
        String correo = request.getParameter("correo_admin");
        String nuevaContrasena = request.getParameter("contrasena_admin");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eps_curitas", "postgres", "SILVER");

            String query = "UPDATE administrador SET nombre=?, apellido=?, cargo=?, telefono=?, correo_electronico=?, contrasena=? WHERE cedula=?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, nombre);
            stmt.setString(2, apellido);
            stmt.setString(3, cargo);
            stmt.setString(4, telefono);
            stmt.setString(5, correo);
            stmt.setString(6, nuevaContrasena);
            stmt.setString(7, cedula);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
        %>
                <div class="alert alert-success" role="alert" style="margin-top: 20px;">
                    Los datos del administrador han sido actualizados exitosamente.
                </div>
        <%
            } else {
        %>
                <div class="alert alert-warning" role="alert" style="margin-top: 20px;">
                    No se han realizado cambios en los datos del administrador.
                </div>
        <%
            }
        } catch (SQLException e) {
        %>
            <div class="alert alert-danger" role="alert" style="margin-top: 20px;">
                Error SQL: <%= e.getMessage() %>
            </div>
        <%
        } catch (ClassNotFoundException e) {
        %>
            <div class="alert alert-danger" role="alert" style="margin-top: 20px;">
                Error de clase: <%= e.getMessage() %>
            </div>
        <%
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
        %>
                <div class="alert alert-danger" role="alert" style="margin-top: 20px;">
                    Error al cerrar la conexión: <%= e.getMessage() %>
                </div>
        <%
            }
        }
        %>
        <a href="actualizar_datos_personales2.jsp" class="btn btn-secondary" style="margin-top: 20px;">Regresar</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
