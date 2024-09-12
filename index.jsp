<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - EPS Curitas</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="icon" type="image/x-icon" href="img/icon.png">
</head>
<body>
    <div class="container">
        <header class="mb-4">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="index.jsp">EPS Curitas</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                Iniciar Sesión
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="login_cliente.jsp">Cliente</a>
                                <a class="dropdown-item" href="login_administrador.jsp">Administrador</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-search" viewBox="0 0 16 16">
                                    <path
                                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85z" />
                                    <path
                                        d="M10.5 6.5a4 4 0 1 1-8 0 4 4 0 0 1 8 0zm-1 0a3 3 0 1 0-6 0 3 3 0 0 0 6 0z" />
                                </svg>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <main role="main">
            <div class="jumbotron">
                <div class="container">
                    <h1 class="display-4">¡Bienvenido a EPS Curitas!</h1>
                    <p class="lead">Descubre una experiencia de atención médica excepcional y personalizada para ti y
                        tus seres queridos.
                    </p>
                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                        <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="https://www.ucatolica.edu.co/portal/wp-content/uploads/2023/02/Noticia-6.jpg" alt="Primera imagen" width="800" height="250">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="https://www.nuevaeps.com.co/sites/default/files/2021-11/Empleadores.jpeg" alt="Segunda imagen" width="800" height="250">
                            </div>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </main>
        <footer class="footer mt-auto py-3">
            <div class="container">
                <span>© 2024 EPS Curitas - Derechos reservados. </span>
            </div>
        </footer>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
