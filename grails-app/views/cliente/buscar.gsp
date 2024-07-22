<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Clientes</title>

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
        <g:link controller="cliente" action="list" class="btn btn-secondary">
            <i class="fa fa-arrow-left"></i> Regresar
        </g:link>
    </div>

</div>

<div class="container-fluid">
    <div class="row justify-content-left align-items-left" style="padding: 20px;">
        <div class="col-auto">
            <label for="criterio" style="color: black; margin-right: 10px;">Buscar por nombre:</label>
        </div>
        <div class="col-auto">
            <input id="criterio" type="text" class="form-control" style="width: 200px;">
        </div>
        <div class="col-auto">
            <button type="button" class="btn btn-dark" id="btn-buscar" style="margin-left: 10px;">Buscar</button>
        </div>
    </div>
</div>

<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th>Id</th>
        <th>Cedula</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Email</th>
        <th>Direccion</th>
        <th>Telefono</th>
    </tr>
    </thead>
    <tbody>
    <g:if test="${clientes.size() > 0}">
        <g:each in="${clientes}" var="cliente">
            <tr data-id="${cliente?.id}">
                <td>${cliente?.id}</td>
                <td>${cliente?.cedula}</td>
                <td>${cliente?.nombre}</td>
                <td>${cliente?.apellido}</td>
                <td>${cliente?.email}</td>
                <td>${cliente?.direccion}</td>
                <td>${cliente?.telefono}</td>
                <td>
                    <a href="#" data-id="${cliente?.id}" class="btn btn-success btn-sm btn-edit btn-ajax"
                       title="Editar">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="#" data-id="${cliente?.id}" class="btn btn-danger btn-sm btn-borrar btn-ajax"
                       title="Eliminar">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="#" data-id="${cliente?.id}" class="btn btn-info btn-sm btn-show btn-ajax"
                       title="Ver Cliente">
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
                    log("Cliente guardado correctamente", "success");
                    setTimeout(function () {
                        location.reload(true);
                    }, 1000);
                } else {
                    log("Error al guardar el cliente", "error")
                }
            }
        });
    }


    function deleteRow(itemId) {
        console.log("borra",itemId)
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>" +
            "¿Está seguro que desea eliminar el cliente seleccionado? Esta acción no se puede deshacer.</p>",
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
                            url: '${createLink(controller: 'cliente', action:'delete_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                if (msg == 'ok') {
                                    setTimeout(function () {
                                        location.reload();
                                    }, 300);
                                } else {
                                    log("Error al borrar el cliente", "error")
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
        var cli = "${clientes}"
        var data = id ? {id: id, cli: cli} : {cli: cli};
        console.log('data', data, cli)
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'cliente', action:'form_ajax')}",
            data: data,
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title + " Cliente" ,
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


    $(function () {

        $("#btn-buscar").click(function () {
            var criterio = $("#criterio").val();
            location.href = "${createLink(action:'buscar')}" + "?crit=" + criterio;
        });


        $(".btn-edit").click(function () {
            var id = $(this).data("id");
            createEditRow(id);
        });
        $(".btn-borrar").click(function () {
            var id = $(this).data("id");
            deleteRow(id);
        });

        $(".btn-show").click(function () {
            var title = "Ver Cliente";
            var id = $(this).data("id");
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'cliente', action:'show_ajax')}",
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
