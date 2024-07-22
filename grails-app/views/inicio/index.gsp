<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="main">
    <title>Title</title>
</head>
<body>
<br>
<br>
     <h1> ¡Bienvenido al sistema usuario!</h1>
<br>
<br>
<br>
<div class="align-content-center text-center">
    <a href="${createLink(controller: 'cliente', action: 'list')}" type="button"
       class="btn btn-info">Clientes</a>

    <a href="${createLink(controller: 'pago', action: 'list')}" type="button"
       class="btn btn-info">Pagos</a>

    <a href="${createLink(controller: 'videojuego', action: 'list')}" type="button"
       class="btn btn-info">Videojuegos</a>

    <a href="${createLink(controller: 'categoria', action: 'list')}" type="button"
       class="btn btn-info">Categorias</a>

</div>




</body>

</html>