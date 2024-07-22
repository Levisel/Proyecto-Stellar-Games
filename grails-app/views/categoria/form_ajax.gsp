
    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmCategoria" role="form" action="save_ajax" method="POST">
            <g:hiddenField name="id" value="${categoria?.id}"/>

            <div class="form-group keeptogether ${hasErrors(bean: categoria, field: 'nombre', 'error')} col-md-12">
                <span class="row">

                    <label for="nombre" class="col-md-1 control-label">
                        Nombre
                    </label>

                    <div class="col-md-5" style="margin-left: 20px">
                        <g:textField name="nombre" maxlength="63" class="form-control input-sm required"
                                     value="${categoria?.nombre}"/>
                    </div>
                </span>
            </div>
        </g:form>
        <div class="col-md-12" style="text-align: end">
            <button id="cerrar" class="btn btn-primary"> Cancelar</button>
            <button id="grabar" class="btn btn-info"> Grabar</button>
        </div>
    </div>

    <script type="text/javascript">


        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                console.log("Llama a validar")
                $("#grabar").click()
                return false;
            }
            return true;
        });


        $("#grabar").click(function () {
            var nombre = $("#nombre").val();
            var url = "${createLink(controller: 'categoria', action:'list')}"

            if (nombre == ''){
                bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                    " Ingrese el nombre de la categoria")
            }else{
                submitForm();
                //$(".modal-dialog").hide()
                setTimeout(function () {
                    location.reload(true)
                }, 300);
                //location.reload(true)
            }

        });

        $("#cerrar").click(function () {
            //location.href("${createLink(controller: 'categoria', action:'list')}")
            location.reload(true)
        });
    </script>
