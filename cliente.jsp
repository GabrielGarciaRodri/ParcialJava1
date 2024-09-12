<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    if (request.getSession(false) == null || request.getSession().getAttribute("email") == null) {
        response.sendRedirect("login_cliente.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Cliente - EPS Curitas</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
    <link rel="stylesheet" href="css/cliente.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand">EPS Curitas</a>
    </nav>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                                class="bi bi-person" viewBox="0 0 16 16">
                                <path
                                    d="M5.5 6a2.5 2.5 0 1 1 5 0 2.5 2.5 0 0 1-5 0zm5.5 1a3.5 3.5 0 0 0-3.5-3.5A3.5 3.5 0 0 0 4 7.5a4.5 4.5 0 0 0-3 4.219c.162.824.493 1.976 1.04 3.281C3.29 15.17 5.29 16 8 16s4.711-.83 6-1.5c.547-1.305.878-2.457 1.04-3.281A4.5 4.5 0 0 0 14 7.5 3.5 3.5 0 0 0 11 4.5zM4 8a5.5 5.5 0 0 1 11 0A5.5 5.5 0 0 1 4 8z" />
                            </svg>
                            Panel Cliente
                        </h2>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="solicitar_cita_medica.jsp">Solicitar Cita Médica</a>
                            </li>
                            <li class="list-group-item">
                                <a href="solicitar_cita_laboratorio.jsp">Solicitar Cita de Laboratorio</a>
                            </li>
                            <li class="list-group-item">
                                <a href="actualizar_datos_personales.jsp">Actualizar Datos Personales</a>
                            </li>
                        </ul>
                        <a href="index.jsp" class="btn btn-secondary btn-block mt-3">Regresar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
