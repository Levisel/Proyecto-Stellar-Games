<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>categorias</title>

    <style type="text/css">
    input:invalid {
        border: 2px dashed red; !important;
    }

    input:invalid:required {
        background-image: linear-gradient(to right, pink, lightgreen);
    }

    input:valid {
        border: 2px solid black;
    }
    </style>

</head>

<body>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<!-- botones -->
<div class="btn-toolbar toolbar">
    <div class="btn-group">
        <g:link controller="inicio" action="index" class="btn btn-secondary">
            <i class="fa fa-arrow-left"></i> Regresar
        </g:link>
    </div>

    <div class="btn-group">
        <a href="#" class="btn btn-primary btnCrear">
            <i class="fa fa-clipboard-list"></i> Nueva categoria
        </a>
    </div>
    <div class="btn-group">
        <g:link controller="categoria" action="buscar" class="btn btn-warning">
            <i class="fa fa-bars"></i> Buscar Categorias
        </g:link>
    </div>
</div>

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
                    <a href="#" data-id="${categoria?.id}" class="btn btn-success btn-sm btn-edit btn-ajax"
                       title="Editar">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="#" data-id="${categoria?.id}" class="btn btn-danger btn-sm btn-borrar btn-ajax"
                       title="Eliminar">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="#" data-id="${categoria?.id}" class="btn btn-info btn-sm btn-show btn-ajax"
                       title="Ver categoria">
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

<script type="text/javascript">
    var id = null;

    function submitForm() {
        var $form = $("#frmCategoria");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        $.ajax({
            type: "POST",
            url: $form.attr("action"),
            data: $form.serialize(),
            success: function (msg) {
                if (msg == 'ok') {
                    log("categoria guardada correctamente", "success");
                    setTimeout(function () {
                        location.reload(true);
                    }, 1000);
                } else {
                    log("Error al guardar la categoria", "error")
                }
            }
        });
    }


    function deleteRow(itemId) {
        console.log("borra",itemId)
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>" +
            "¿Está seguro que desea eliminar la categoria seleccionada? Esta acción no se puede deshacer.</p>",
            closeButton: false,
            buttons: {
                cancelar: {
                    label: "Cancelar",
                    className: "btn-primary",
                    callback: function () {
                    }
                },
                eliminar: {
                    label: "<i class='fa fa-trash'></i> Eliminar",
                    className: "btn-danger",
                    callback: function () {
                        $.ajax({
                            type: "POST",
                            url: '${createLink(controller: 'categoria', action:'delete_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                if (msg == 'ok') {
                                    setTimeout(function () {
                                        location.reload();
                                    }, 300);
                                } else {
                                    log("Error al borrar la categoria", "error")
                                }
                            }
                        });
                    }
                }
            }
        });
    }

    function createEditRow(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? {id: id} : {};
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'categoria', action:'form_ajax')}",
            data: data,
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title + " categoria" ,
                    closeButton: false,
                    message: msg,
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").first().focus()
                }, 500);
            } //successJava
        });
        //location.reload()//ajax
    }

    //createEdit

    $(function () {

        $(".btnCrear").click(function () {
            createEditRow();
            return false;
        });

        $(".btn-edit").click(function () {
            var id = $(this).data("id");
            createEditRow(id);
        });

        $(".btn-borrar").click(function () {
            var id = $(this).data("id");
            deleteRow(id);
        });

        $(".btn-canton").click(function () {
            var id = $(this).data("id");
            //mostrar la lista de cantones
            location.href = "${createLink(controller: 'canton', action:'list')}/"+id
        });

        $(".btn-show").click(function () {
            var title = "Ver categoria";
            var id = $(this).data("id");
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'categoria', action:'show_ajax')}",
                data: {id: id},
                success: function (msg) {
                    var b = bootbox.dialog({
                        title: title,
                        closeButton: false,
                        message: msg,
                        buttons: {
                            aceptar: {
                                label: "Aceptar",
                                className: "btn-primary",
                                callback: function () {
                                }
                            }
                        },
                    }); //dialog
                    setTimeout(function () {
                        b.find(".form-control").first().focus()
                    }, 500);
                } //successJava
            });
            //location.reload()//ajax
        });
    });
</script>

</body>
</html>
