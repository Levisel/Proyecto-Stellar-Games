
<g:if test="${videojuego?.categoria}">
    <div class="row">
        <div class="col-md-2 show-label">
            Categoria
        </div>

        <div class="col-md-8">
            %{--<g:fieldValue bean="${videojuego}" field="nombre"/> --}%
            <span style="background-color: #ddd">${videojuego?.categoria}</span>
        </div>
    </div>
</g:if>

<g:if test="${videojuego?.id}">
    <div class="row">
        <div class="col-md-2 show-label">
            Id
        </div>

        <div class="col-md-8">
            <g:fieldValue bean="${videojuego}" field="id"/>
        </div>
    </div>
</g:if>


<g:if test="${videojuego?.nombre}">
    <div class="row">
        <div class="col-md-2 show-label">
            Nombre
        </div>

        <div class="col-md-8">
            %{--<g:fieldValue bean="${videojuego}" field="nombre"/> --}%
            <span style="background-color: #ddd">${videojuego?.nombre}</span>
        </div>
    </div>
</g:if>

<g:if test="${videojuego?.precio}">
    <div class="row">
        <div class="col-md-2 show-label">
            Precio
        </div>

        <div class="col-md-8">
            %{--<g:fieldValue bean="${videojuego}" field="nombre"/> --}%
            <span style="background-color: #ddd">${videojuego?.precio}</span>
        </div>
    </div>
</g:if>


