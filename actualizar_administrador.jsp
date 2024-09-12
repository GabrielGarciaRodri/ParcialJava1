<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Actualizar Administrador</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
    <link rel="stylesheet" href="css/actualizar_administrador.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">EPS Curitas</a>
    </nav>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8 offset-md-2">
             <h2 class="center-title mb-4">Actualizar Datos Personales</h2>
                <%
                String cedula = request.getParameter("cedula_admin");

                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("org.postgresql.Driver");
                    conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eps_curitas", "postgres", "SILVER");

                    String query = "SELECT * FROM administrador WHERE cedula=?";
                    stmt = conn.prepareStatement(query);
                    stmt.setString(1, cedula);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        String nombre = rs.getString("nombre");
                        String apellido = rs.getString("apellido");
                        String cargo = rs.getString("cargo");
                        String telefono = rs.getString("telefono");
                        String correo = rs.getString("correo_electronico");
                        String contrasena = rs.getString("contrasena");
                %>
                        <form action="actualizar_administrador2.jsp" method="post">
                            <input type="hidden" name="cedula_admin" value="<%= cedula %>">
                            <div class="form-group">
                                <label for="nombre_admin">Nombre</label>
                                <input type="text" class="form-control" id="nombre_admin" name="nombre_admin" value="<%= nombre %>" required>
                            </div>
                            <div class="form-group">
                                <label for="apellido_admin">Apellido</label>
                                <input type="text" class="form-control" id="apellido_admin" name="apellido_admin" value="<%= apellido %>" required>
                            </div>
                            <div class="form-group">
                                <label for="cargo_admin">Cargo</label>
                                <input type="text" class="form-control" id="cargo_admin" name="cargo_admin" value="<%= cargo %>" required>
                            </div>
                            <div class="form-group">
                                <label for="telefono_admin">Teléfono</label>
                                <input type="text" class="form-control" id="telefono_admin" name="telefono_admin" value="<%= telefono %>" required>
                            </div>
                            <div class="form-group">
                                <label for="correo_admin">Correo Electrónico</label>
                                <input type="email" class="form-control" id="correo_admin" name="correo_admin" value="<%= correo %>" required>
                            </div>
                            <div class="form-group">
                                <label for="contrasena_admin">Contraseña</label>
                                <input type="password" class="form-control" id="contrasena_admin" name="contrasena_admin" value="<%= contrasena %>" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Actualizar Administrador</button>
                            <a href="actualizar_datos_personales2.jsp" class="btn btn-secondary">Regresar</a>
                        </form>
                <%
                    } else {
                %>
                            <div class="alert alert-danger error-message" role="alert">
                                No se encontró ningún administrador con la cédula especificada.
                            </div>
                            <div class="col-md-12 text-center">
                                <a href="actualizar_datos_personales2.jsp" class="btn btn-secondary btn-regresar">Regresar</a>
                            </div>
                <%
                    }
                } catch (SQLException e) {
                %>
                    <div class="alert alert-danger" role="alert">
                        Error SQL: <%= e.getMessage() %>
                    </div>
                <%
                } catch (ClassNotFoundException e) {
                %>
                    <div class="alert alert-danger" role="alert">
                        Error de clase: <%= e.getMessage() %>
                    </div>
                <%
                } finally {
                    try {
                        if (rs != null) {
                            rs.close();
                        }
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (SQLException e) {
                %>
                        <div class="alert alert-danger" role="alert">
                            Error al cerrar la conexión: <%= e.getMessage() %>
                        </div>
                <%
                    }
                }
                %>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
