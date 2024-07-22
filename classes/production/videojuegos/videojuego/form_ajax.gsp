
<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmVideojuego" role="form" action="save_ajax" method="POST">
        <g:hiddenField name="id" value="${videojuego?.id}"/>

        <div class="form-group row keeptogether ${hasErrors(bean: videojuego, field: 'nombre', 'error')}">
            <label for="categoria" class="col-md-2 col-form-label">
                categoria
            </label>
            <div class="col-md-10">
                <select name="categoria" id="categoria" class="form-control input-sm required">
                    <option value="">Seleccione</option>
                    <g:each in="${categorias}" var="categoria">
                        <g:if test="${categoria.id == videojuego?.categoria?.id}">
                            <option value="${categoria?.id}" selected>${categoria?.nombre}</option>
                        </g:if>
                        <g:else>
                            <option value="${categoria?.id}">${categoria?.nombre}</option>
                        </g:else>
                    </g:each>
                </select>
            </div>
        </div>
        

        <div class="form-group row keeptogether ${hasErrors(bean: videojuego, field: 'nombre', 'error')}">
            <label for="nombre" class="col-md-2 col-form-label">
                Nombre
            </label>
            <div class="col-md-10">
                <g:textField name="nombre" maxlength="61" class="form-control input-sm required"
                             value="${videojuego?.nombre}"/>
            </div>
        </div>

        <div class="form-group row keeptogether ${hasErrors(bean: videojuego, field: 'precio', 'error')}">
            <label for="precio" class="col-md-2 col-form-label">
                precio
            </label>
            <div class="col-md-10">
                <g:textField name="precio"  type="number" class="form-control input-sm required"
                             value="${videojuego?.precio ?: 0.00}" step="0.01"/>
            </div>
        </div>


        <div class="form-group row keeptogether ${hasErrors(bean: videojuego, field: 'imagen', 'error')}">
            <label for="imagen" class="col-md-2 col-form-label">
                Imagen
            </label>
            <div class="col-md-10">
                <g:textField name="imagen" maxlength="2000" class="form-control input-sm required"
                             value="${videojuego?.imagen}"/>
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
        var categoria = $("#categoria").val();
        var nombre = $("#nombre").val();
        var precio = $("#precio").val();
        var imagen = $("#imagen").val();
        var url = "${createLink(controller: 'videojuego', action:'list')}"

            if(nombre !== '') {
                submitForm();
                setTimeout(function () {
                    location.reload(true);
                }, 300);
            } else {
                bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                    " Ingrese el nombre del videojuego.");
            }

    });

    $("#cerrar").click(function () {
        //location.href("${createLink(controller: 'videojuego', action:'list')}")
        location.reload(true)
    });
</script>
