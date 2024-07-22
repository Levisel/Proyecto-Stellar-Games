<g:if test="${cliente?.id}">
    <div class="row">
        <div class="col-md-2 show-label">
            Id
        </div>

        <div class="col-md-8">
            <g:fieldValue bean="${cliente}" field="id"/>
        </div>
    </div>
</g:if>
<g:if test="${cliente?.cedula}">
    <div class="row">
        <div class="col-md-2 show-label">
            Cedula
        </div>

        <div class="col-md-8">
            %{--<g:fieldValue bean="${cliente}" field="nombre"/> --}%
            <span style="background-color: #ddd">${cliente?.cedula}</span>
        </div>
    </div>
</g:if>
<g:if test="${cliente?.nombre}">
    <div class="row">
        <div class="col-md-2 show-label">
            Nombre
        </div>

        <div class="col-md-8">
            %{--<g:fieldValue bean="${cliente}" field="nombre"/> --}%
            <span style="background-color: #ddd">${cliente?.nombre}</span>
        </div>
    </div>
</g:if>
<g:if test="${cliente?.apellido}">
    <div class="row">
        <div class="col-md-2 show-label">
            Apellido
        </div>

        <div class="col-md-8">
            <span style="background-color: #ddd">${cliente?.apellido}</span>
        </div>
    </div>
</g:if>
<g:if test="${cliente?.email}">
    <div class="row">
        <div class="col-md-2 show-label">
            Email
        </div>

        <div class="col-md-8">
            <span style="background-color: #ddd">${cliente?.email}</span>
        </div>
    </div>
</g:if>
<g:if test="${cliente?.direccion}">
    <div class="row">
        <div class="col-md-2 show-label">
            Direccion
        </div>

        <div class="col-md-8">
            <span style="background-color: #ddd">${cliente?.direccion}</span>
        </div>
    </div>
</g:if>
<g:if test="${cliente?.telefono}">
    <div class="row">
        <div class="col-md-2 show-label">
            Telefono
        </div>

        <div class="col-md-8">
            <span style="background-color: #ddd">${cliente?.telefono}</span>
        </div>
    </div>
</g:if>

