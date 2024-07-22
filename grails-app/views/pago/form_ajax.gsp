
<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmPago" role="form" action="save_ajax" method="POST">
        <g:hiddenField name="id" value="${pago?.id}"/>

        <div class="form-group row keeptogether ${hasErrors(bean: pago, field: 'cliente', 'error')}">
            <label for="cliente" class="col-md-2 col-form-label">
                Cliente
            </label>
            <div class="col-md-10">
                <select name="cliente" id="cliente" class="form-control input-sm required">
                    <option value="">Seleccione</option>
                    <g:each in="${clientes}" var="cliente">
                        <g:if test="${cliente.id == pago?.cliente?.id}">
                            <option value="${cliente?.id}" selected>${cliente?.nombre +" "+ cliente?.apellido}</option>
                        </g:if>
                        <g:else>
                            <option value="${cliente?.id}">${cliente?.nombre +" "+ cliente?.apellido}</option>
                        </g:else>
                    </g:each>
                </select>
            </div>
        </div>

        <div class="form-group row keeptogether ${hasErrors(bean: pago, field: 'videojuego', 'error')}">
            <label for="videojuego" class="col-md-2 col-form-label">
                Videojuego
            </label>
            <div class="col-md-10">
                <select name="videojuego" id="videojuego" class="form-control input-sm required">
                    <option value="">Seleccione</option>
                    <g:each in="${videojuegos}" var="videojuego">
                        <g:if test="${videojuego.id == pago?.videojuego?.id}">
                            <option value="${videojuego?.id}" selected>${videojuego?.nombre}</option>
                        </g:if>
                        <g:else>
                            <option value="${videojuego?.id}">${videojuego?.nombre}</option>
                        </g:else>
                    </g:each>
                </select>
            </div>
        </div>
        

        <div class="form-group row keeptogether ${hasErrors(bean: pago, field: 'monto', 'error')}">
            <label for="monto" class="col-md-2 col-form-label">
                Monto
            </label>
            <div class="col-md-10">
                <g:textField name="monto" type="number" class="form-control input-sm required"
                             value="${pago?.monto ?: 0.00}" step="0.01"/>
            </div>
        </div>

        <div class="form-group row keeptogether ${hasErrors(bean: pago, field: 'fecha', 'error')}">
            <label for="fecha" class="col-md-2 col-form-label">
                Fecha
            </label>
            <div class="col-md-10">
                <g:datePicker name="fecha" precision="day" class="form-control input-sm required" value="${pago?.fecha ?: new Date()}"/>
            </div>
        </div>


        <div class="form-group row keeptogether ${hasErrors(bean: pago, field: 'estado', 'error')}">
            <label for="estado" class="col-md-2 col-form-label">
                Estado
            </label>
            <div class="col-md-10">
                <g:select name="estado" class="form-control input-sm required"
                          value="${pago?.estado}"
                          from="${estadosDisponibles}"
                          noSelection="['':'- Seleccione -']"/>
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
        var cliente = $("#cliente").val();
        var videojuego = $("#videojuego").val();
        var monto = $("#monto").val();
        var fecha = $("#fecha").val();
        var estado = $("#estado").val();
        var url = "${createLink(controller: 'pago', action:'list')}"

            if(monto !== '') {
                submitForm();
                setTimeout(function () {
                    location.reload(true);
                }, 300);
            } else {
                bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                    " Ingrese el monto del pago.");
            }



    });

    $("#cerrar").click(function () {
        //location.href("${createLink(controller: 'pago', action:'list')}")
        location.reload(true)
    });
</script>
