<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Datos Personales</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
    <link rel="stylesheet" href="css/actualizar_datos_personales.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand">EPS Curitas</a>
    </nav>

    <div class="container mt-5">
        <h2 class="center-title mb-4">Actualizar Datos Personales</h2>
        <form action="modificar_cliente2.jsp" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="cedulaClienteMod">Cédula del Cliente</label>
                                    <input type="text" class="form-control" id="cedulaClienteMod" name="cedulaClienteMod" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Buscar y Modificar Cliente</button>
                        </form>
            <div style="margin-top: 20px;">
                <a href="cliente.jsp" class="btn btn-info">Regresar</a>
            </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
