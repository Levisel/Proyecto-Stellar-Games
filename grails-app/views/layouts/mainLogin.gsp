<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stellar Games</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="star.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="font-awesome.min.css"/>

    <asset:stylesheet src="bootstrap.css"/>
    <asset:javascript src="jquery-3.3.1.min.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="bootstrap.bundle.js"/>

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
                        <h2 style="color: white">Stellar Corp - Porfavor, ingrese al Sistema..  🌐 </h2>
                    </ul>
                </div>
        </nav>
    </div>
</header>

<script>
    document.getElementById('adminSelect').addEventListener('change', function() {
        var url = this.value;
        console.log(url)
        if (url) {
            window.location.href = url;
        }
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

</body>
</html>
