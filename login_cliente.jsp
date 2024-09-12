<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cliente - Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login_cliente.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
</head>

<body class="body">
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar">
        <a class="navbar-brand">EPS Curitas</a>
    </nav>
    <div class="container mt-5">
        <h2>Bienvenido</h2>
        <% 
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            String url = "jdbc:postgresql://localhost:5432/eps_curitas";
            String username = "postgres"; 
            String passwordDB = "SILVER";
            
            try {
                Class.forName("org.postgresql.Driver");
                Connection con = DriverManager.getConnection(url, username, passwordDB);
                
                PreparedStatement ps = con.prepareStatement("SELECT * FROM cliente WHERE correo_electronico = ? AND contrasena = ?");
                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                
                if (rs.next()) {
                    session.setAttribute("email", email);
                    response.sendRedirect("cliente.jsp");
                } else {
        %>
                    <div id="error-message">
                        <p style="color:red;">Credenciales inválidas. Inténtelo de nuevo.</p>
                    </div>
                    <script>
                        setTimeout(function() {
                            var errorMessage = document.getElementById('error-message');
                            if (errorMessage) {
                                errorMessage.style.display = 'none';
                            }
                        }, 5000);
                    </script>
        <%
                }
                
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
        %>
        <form action="login_cliente.jsp" method="post">
            <div class="form-group">
                <label for="email">Correo Electrónico</label>
                <input type="email" class="form-control" id="email" name="email"
                    placeholder="Ingrese su correo electrónico" required>
            </div>
            <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password"
                    placeholder="Ingrese su contraseña" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
        <div class="text-center my-3">
            <p style="margin-top: 10px; margin-bottom: 10px;">¿Aún no tienes una cuenta?</p>
            <a href="registro_cliente.jsp" class="btn btn-info btn-block">Crear una cuenta</a>
        </div>
        <a href="index.jsp" class="btn btn-secondary btn-block mt-3">Regresar</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>