<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    if (request.getSession(false) == null || request.getSession().getAttribute("email") == null) {
    
        response.sendRedirect("login_administrador.jsp");
        return;
    }
%>
        
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Administrador - EPS Curitas</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
    <link rel="stylesheet" href="css/administrador.css">
    
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand">EPS Curitas</a>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="showSection('medicos')">Gestión de Medicos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="showSection('clientes')">Gestión de Clientes</a>
            </li>
        </ul>
    </nav>
    <div class="container mt-5">
        <h2 class="text-center">Panel Administrador</h2>
            <ul class="list-unstyled">
                <li>
                    <a href="actualizar_datos_personales2.jsp" class="btn btn-outline-primary">Actualizar Datos Personales</a>
                </li>
            </ul>
        <div class="row">
            <div class="col-md-6" id="medicos">
                 <div class="card mt-4 center-form">
                    <div class="card-header bg-primary text-white">
                        Gestión de Médicos
                    </div>
                    <div class="card-body">
                        <form action="crear_medico.jsp" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="cedulaMedico">Cédula</label>
                                    <input type="text" class="form-control" id="cedulaMedico" name="cedulaMedico" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="nombreMedico">Nombre</label>
                                    <input type="text" class="form-control" id="nombreMedico" name="nombreMedico" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="apellidoMedico">Apellido</label>
                                    <input type="text" class="form-control" id="apellidoMedico" name="apellidoMedico" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="especialidadMedico">Especialidad</label>
                                    <input type="text" class="form-control" id="especialidadMedico" name="especialidadMedico" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="telefonoMedico">Teléfono</label>
                                    <input type="text" class="form-control" id="telefonoMedico" name="telefonoMedico">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="correoMedico">Correo Electrónico</label>
                                    <input type="email" class="form-control" id="correoMedico" name="correoMedico">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="contrasenaMedico">Contraseña</label>
                                    <input type="password" class="form-control" id="contrasenaMedico" name="contrasenaMedico" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Crear Médico</button>
                        </form>
                        <hr>
                        <form action="modificar_medico.jsp" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="cedulaMedicoMod">Cédula del Médico</label>
                                    <input type="text" class="form-control" id="cedulaMedicoMod" name="cedulaMedicoMod" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Buscar y Modificar Médico</button>
                        </form>
                        <hr>
                        <form action="eliminar_medico.jsp" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="cedulaMedicoEliminar">Cédula del Médico</label>
                                    <input type="text" class="form-control" id="cedulaMedicoEliminar" name="cedulaMedicoEliminar" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-danger">Eliminar Médico</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6" id="clientes" style="display:none;">
                <div class="card mt-4 center-form">
                    <div class="card-header bg-primary text-white">
                        Gestión de Clientes
                    </div>
                    <div class="card-body">
                        <form action="crear_cliente.jsp" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="cedulaCliente">Cédula</label>
                                    <input type="text" class="form-control" id="cedulaCliente" name="cedulaCliente" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="nombreCliente">Nombre</label>
                                    <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="apellidoCliente">Apellido</label>
                                    <input type="text" class="form-control" id="apellidoCliente" name="apellidoCliente" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="edadCliente">Edad</label>
                                    <input type="text" class="form-control" id="edadCliente" name="edadCliente">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="direccionCliente">Dirección</label>
                                    <input type="text" class="form-control" id="direccionCliente" name="direccionCliente">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="telefonoCliente">Teléfono</label>
                                    <input type="text" class="form-control" id="telefonoCliente" name="telefonoCliente">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="correoCliente">Correo Electrónico</label>
                                    <input type="email" class="form-control" id="correoCliente" name="correoCliente">
                                </div>
                                <div class="form-group col-md-6">
                                <label for="contrasenaCliente">Contraseña</label>
                                <input type="password" class="form-control" id="contrasenaCliente" name="contrasenaCliente" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Crear Cliente</button>
                        </form>
                        <hr>
                        <form action="modificar_cliente.jsp" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="cedulaClienteMod">Cédula del Cliente</label>
                                    <input type="text" class="form-control" id="cedulaClienteMod" name="cedulaClienteMod" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Buscar y Modificar Cliente</button>
                        </form>
                        <hr>
                        <form action="eliminar_cliente.jsp" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="cedulaClienteEliminar">Cédula del Cliente</label>
                                    <input type="text" class="form-control" id="cedulaClienteEliminar" name="cedulaClienteEliminar" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-danger">Eliminar Cliente</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <a href="login_administrador.jsp" class="btn btn-secondary btn-block mt-3">Regresar</a>
    </div>

        <script>
        function showSection(sectionId) {
            document.getElementById('medicos').style.display = 'none';
            document.getElementById('clientes').style.display = 'none';
            document.getElementById(sectionId).style.display = 'block';
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
