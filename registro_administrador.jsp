<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Administrador</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/registro.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">EPS Curitas</a>
    </nav>

    <div class="container mt-5">
        <h1 class="text-center mb-5">Registro de Administrador</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="registrar_administrador.jsp" method="POST">
                    <div class="form-group">
                        <label for="cedula_admin">Cedula</label>
                        <input type="text" class="form-control" id="cedula_admin" name="cedula_admin"
                            placeholder="Ingrese su cedula" required>
                    </div>
                    <div class="form-group">
                        <label for="nombre_admin">Nombre</label>
                        <input type="text" class="form-control" id="nombre_admin" name="nombre_admin"
                            placeholder="Ingrese su nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido_admin">Apellido</label>
                        <input type="text" class="form-control" id="apellido_admin" name="apellido_admin"
                            placeholder="Ingrese su apellido" required>
                    </div>
                    <div class="form-group">
                        <label for="cargo_admin">Cargo</label>
                        <input type="text" class="form-control" id="cargo_admin" name="cargo_admin"
                            placeholder="Ingrese su cargo" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono_admin">Telefono</label>
                        <input type="tel" class="form-control" id="telefono_admin" name="telefono_admin"
                            placeholder="Ingrese su telefono" required>
                    </div>
                    <div class="form-group">
                        <label for="correo_admin">Correo Electronico</label>
                        <input type="email" class="form-control" id="correo_admin" name="correo_admin"
                            placeholder="Ingrese su correo electronico" required>
                    </div>
                    <div class="form-group">
                        <label for="contrasena_admin">Contrasena</label>
                        <input type="password" class="form-control" id="contrasena_admin" name="contrasena_admin"
                            placeholder="Ingrese su contrasena" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Registrarse</button>
                    <a href="login_administrador.jsp" class="btn btn-secondary btn-block">Regresar</a>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
