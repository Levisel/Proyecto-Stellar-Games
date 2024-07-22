<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="main">
    <title>Title</title>
</head>
<body>


<div class="container my-5">

    <table class="table table-condensed table-bordered table-striped table-hover">
        <thead>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <g:if test="${categorias.size() > 0}">
            <g:each in="${categorias}" var="categoria">
                <tr data-id="${categoria?.id}">
                    <td>${categoria?.id}</td>
                    <td>${categoria?.nombre}</td>
                    <td>
                        <a href="#" data-id="${categoria?.id}" class="btn btn-info btn-sm btn-show btn-ajax"
                           title="Ver videojuegos para la categoria">
                            <i class="fa fa-search"></i>
                        </a>
                    </td>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <tr class="danger">
                <td class="text-center" colspan="2">
                    No se encontraron registros que mostrar
                </td>
            </tr>
        </g:else>
        </tbody>
    </table>


    <script>
    $(function () {


    $(".btn-show").click(function () {
    var id = $(this).data("id");
    //mostrar la lista de cantones
    location.href = "${createLink(controller: 'inicio', action:'secciones')}/"+id
    });
    });
</script>



    </div>


</body>

</html>