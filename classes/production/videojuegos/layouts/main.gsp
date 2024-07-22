<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stellar Games</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Enlazar hojas de estilo -->
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:link rel="icon" href="star.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Incluir JS de Bootstrap con Popper (Bootstrap Bundle) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <asset:stylesheet src="font-awesome.min.css"/>
    <asset:javascript src="jquery-3.3.1.min.js"/>
    <asset:javascript src="bootbox.js"/>
    <asset:javascript src="fontawesome.all.min.js"/>


    <g:layoutHead/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Albert+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>

<!--------------HEADER------------------------------------------------------------------------------------------------------>

<header class="header bg-dark">
    <div class="container">
        <div class="cart-container">
            <div class="cart-icon">
                <a id="miCarro">
                    <g:link controller="inicio" action="carrito">
                        <i class="bx bx-cart" id="logo-carro"></i>
                    </g:link>
                </a>
                <span id="cart-count">0</span>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <g:link controller="inicio" action="home" class="navbar-brand">
                    <img src="https://www.freeiconspng.com/thumbs/gaming-logo/gaming-joystick-logo-png-image-26.png" alt="logo" class="logo">
                </g:link>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse ml-5" id="navbarNav">
                    <ul class="navbar-nav ms-auto mb-0">
                        <li class="nav-item me-4">
                            <g:link controller="inicio" action="home" class="nav-link">Inicio</g:link>
                        </li>
                        <li class="nav-item me-4">
                            <g:link controller="inicio" action="contacto" class="nav-link">Contacto</g:link>
                        </li>
                        <li class="nav-item dropdown me-4">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Categorias
                            </a>
                            <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown" id="categorias-dropdown">
                                <!-- Las categorías serán cargadas aquí dinámicamente -->
                            </ul>
                        </li>
                        <li class="nav-item dropdown me-4">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Administracion
                            </a>
                            <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown" id="admin-dropdown">
                                <li>
                                    <g:link controller="categoria" action="list" class="nav-link">Categorias</g:link>
                                </li>
                                <li>
                                    <g:link controller="videojuego" action="list" class="nav-link">Videojuegos</g:link>
                                </li>
                                <li>
                                    <g:link controller="pago" action="list" class="nav-link">Pagos</g:link>
                                </li>
                                <li>
                                    <g:link controller="cliente" action="list" class="nav-link">Clientes</g:link>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item me-4">
                            <g:link controller="login" action="logout" class="nav-link">Cerrar sesion</g:link>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>


<!-- Scripts necesarios -->
<asset:javascript src="jquery.min.js"/>
<asset:javascript src="bootstrap.bundle.min.js"/>
<asset:javascript src="application.js"/>

<g:javascript library="core"/>



<style>
.custom:hover {
    color: black !important; /* Cambia esto al color que desees */
}
</style>

<script>
    $(document).ready(function() {
        console.log("Cargando categorias...");

        // Cargar dinámicamente los categorias en el dropdown
        $.ajax({
            type: "GET",
            url: "${createLink(controller: 'videojuego', action: 'obtenerCategorias')}",
            success: function(response) {
                console.log("categorias recibidos:", response);
                if (Array.isArray(response)) {
                    var dropdown = $("#categorias-dropdown");
                    dropdown.empty();
                    $.each(response, function(index, categoria) {
                        dropdown.append('<li><a href="#" data-id="' + categoria.id + '" class=" categoria-link dropdown-item text-white custom">' + categoria.nombre + '</a></li>');
                    });

                    // Asignar el evento click a los nuevos elementos del dropdown
                    $(".categoria-link").click(function(e) {
                        e.preventDefault();
                        var categoriaId = $(this).data("id");
                        console.log("Categoria seleccionado ID:", categoriaId);
                        window.location.href = "${createLink(controller: 'inicio', action: 'secciones')}" + "/" + categoriaId;
                    });
                } else {
                    console.error("El formato de los datos recibidos es incorrecto.");
                }
            },
            error: function(xhr, status, error) {
                console.error("Error al cargar los categorias:", status, error);
            }
        });


    });
    $(document).ready(function() {
        var cartCountElements = $('#cart-count');

        // Obtén el valor del contador del carrito desde localStorage
        var cartItemCount = localStorage.getItem('cartItemCount') || 0;

        // Actualiza el contador del carrito en todas las páginas
        cartCountElements.text(cartItemCount);
    });
</script>

<div class = "flex-grow-1">
<g:layoutBody/>
</div>

<footer class="bg-dark text-center text-white">
    <div class="container p-4">
        <!-- Sección de íconos de redes sociales -->
        <section class="mb-4">
            <!-- Facebook -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                <i class="fab fa-facebook-f"></i>
            </a>

            <!-- Twitter -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                <i class="fab fa-twitter"></i>
            </a>

            <!-- Google -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                <i class="fab fa-google"></i>
            </a>

            <!-- Instagram -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                <i class="fab fa-instagram"></i>
            </a>

            <!-- Linkedin -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                <i class="fab fa-linkedin-in"></i>
            </a>

            <!-- Github -->
            <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
                <i class="fab fa-github"></i>
            </a>
        </section>
        <!-- Fin de la sección de íconos de redes sociales -->
    </div>
    <!-- Fin del contenedor -->
    <!-- Texto de derechos de autor -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2024 Copyright:
        <a class="text-white" href="">Stellar Corp</a>
    </div>
    <!-- Fin del texto de derechos de autor -->
</footer>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>
<asset:javascript src=".js"/>

</body>
</html>
