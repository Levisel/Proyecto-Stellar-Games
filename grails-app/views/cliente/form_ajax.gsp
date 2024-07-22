
    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmCliente" role="form" action="save_ajax" method="POST">
            <g:hiddenField name="id" value="${cliente?.id}"/>

            <div class="form-group row keeptogether ${hasErrors(bean: cliente, field: 'cedula', 'error')}">
                <label for="cedula" class="col-md-2 col-form-label">
                   Cedula
                </label>
                <div class="col-md-10">
                    <g:textField name="cedula" maxlength="61" class="form-control input-sm required"
                                 value="${cliente?.cedula}"/>
                </div>
            </div>

            <div class="form-group row keeptogether ${hasErrors(bean: cliente, field: 'nombre', 'error')}">
                <label for="nombre" class="col-md-2 col-form-label">
                    Nombre
                </label>
                <div class="col-md-10">
                    <g:textField name="nombre" maxlength="61" class="form-control input-sm required"
                                 value="${cliente?.nombre}"/>
                </div>
            </div>

            <div class="form-group row keeptogether ${hasErrors(bean: cliente, field: 'apellido', 'error')}">
                <label for="nombre" class="col-md-2 col-form-label">
                    Apellido
                </label>
                <div class="col-md-10">
                    <g:textField name="apellido" maxlength="61" class="form-control input-sm required"
                                 value="${cliente?.apellido}"/>
                </div>
            </div>

            <div class="form-group row keeptogether ${hasErrors(bean: cliente, field: 'email', 'error')}">
                <label for="email" class="col-md-2 col-form-label">
                    Email
                </label>
                <div class="col-md-10">
                    <g:textField name="email" maxlength="61" class="form-control input-sm required"
                                 value="${cliente?.email}"/>
                </div>
            </div>

            <div class="form-group row keeptogether ${hasErrors(bean: cliente, field: 'direccion', 'error')}">
                <label for="direccion" class="col-md-2 col-form-label">
                    Direccion
                </label>
                <div class="col-md-10">
                    <g:textField name="direccion" maxlength="61" class="form-control input-sm required"
                                 value="${cliente?.direccion}"/>
                </div>
            </div>

            <div class="form-group row keeptogether ${hasErrors(bean: cliente, field: 'telefono', 'error')}">
                <label for="telefono" class="col-md-2 col-form-label">
                    Telefono
                </label>
                <div class="col-md-10">
                    <g:textField name="telefono" maxlength="10" class="form-control input-sm required"
                                 value="${cliente?.telefono}"/>
                </div>
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
            var cedula = $("#cedula").val();
            var nombre = $("#nombre").val();
            var apellido = $("#apellido").val();
            var email = $("#email").val();
            var direccion = $("#direccion").val();
            var telefono = $("#telefono").val();
            var url = "${createLink(controller: 'cliente', action:'list')}"

            if (nombre == ''){
                bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                    " Ingrese el nombre del cliente")
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
            //location.href("${createLink(controller: 'cliente', action:'list')}")
            location.reload(true)
        });
    </script>
