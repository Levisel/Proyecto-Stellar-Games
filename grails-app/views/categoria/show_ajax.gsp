<g:if test="${categoria?.id}">
    <div class="row">
        <div class="col-md-2 show-label">
            Id
        </div>

        <div class="col-md-8">
            <g:fieldValue bean="${categoria}" field="id"/>
        </div>
    </div>
</g:if>
<g:if test="${categoria?.nombre}">
    <div class="row">
        <div class="col-md-2 show-label">
            Nombre
        </div>

        <div class="col-md-8">
            %{--<g:fieldValue bean="${categoria}" field="nombre"/> --}%
            <span style="background-color: #ddd">${categoria?.nombre}</span>
        </div>
    </div>
</g:if>
