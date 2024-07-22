
<g:if test="${pago?.cliente}">
    <div class="row">
        <div class="col-md-2 show-label">
            Cliente
        </div>

        <div class="col-md-8">
            <span style="background-color: #ddd">${pago?.cliente}</span>
        </div>
    </div>
</g:if>

<g:if test="${pago?.videojuego}">
    <div class="row">
        <div class="col-md-2 show-label">
            Videojuego
        </div>

        <div class="col-md-8">
            <span style="background-color: #ddd">${pago?.videojuego}</span>
        </div>
    </div>
</g:if>



<g:if test="${pago?.monto}">
    <div class="row">
        <div class="col-md-2 show-label">
           Monto
        </div>

        <div class="col-md-8">
            <span style="background-color: #ddd">${pago?.monto}</span>
        </div>
    </div>
</g:if>

<g:if test="${pago?.fecha}">
    <div class="row">
        <div class="col-md-2 show-label">
            Fecha
        </div>

        <div class="col-md-8">
            <span style="background-color: #ddd">${pago?.fecha}</span>
        </div>
    </div>
</g:if>

<g:if test="${pago?.estado}">
    <div class="row">
        <div class="col-md-2 show-label">
            Estado
        </div>

        <div class="col-md-8">
            <span style="background-color: #ddd">${pago?.estado}</span>
        </div>
    </div>
</g:if>


