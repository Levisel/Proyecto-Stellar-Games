<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mainLogin">

    <title>Login</title>

    <style type="text/css">
    .hidden {
        display: none;
    }
    </style>
</head>

<body>

<div style="text-align: center; margin-top: 22px; height: ${(flash.message) ? '640' : '570'}px;" class="well">

    <h1 class="titl" style="font-size: 24px; color: #06a">Sistema de Administracion Stellar Corp</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="dialog ui-corner-all" style="height: 160px;padding: 10px;width: 910px;margin: auto;margin-top: 5px">
            <div>
               <img src="https://www.questionpro.com/blog/wp-content/uploads/2022/09/Portada-administracion-de-personal.jpg" style="padding: 20px; height: 350px"/>
            </div>
</div>
    <div id="cargando" class="text-center hidden">
        <h1>Validando...</h1>
        %{--<img src="${resource(dir: 'images', file: 'spinner32.gif')}" width="32px" height="32px"/>--}%
    </div>




    <div style="width: 100%;height: 60px;float: left; margin-bottom:5px; margin-top: 30px; text-align: center">
            <a href="#" id="ingresar" class="btn btn-info"
               style="width: 120px; margin-top: 180px">
                Ingresar <i class="fas fa-user-times"></i></a>
        </div>



        <p class="text-info pull-left" style="font-size: 10px; margin-top: 150px; float: left">
            Versión ${message(code: 'version', default: '1.1.0x')}
        </p>
    </div>


    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                </div>
            <h4 class="modal-title" style="text-align: center">Ingresar al Sistema</h4>
                <div class="modal-body">

                    <g:form name="frmLogin" action="validar" style="padding: 10px">
                        <div class="row">
                            <div class="col-md-5" style="text-align: right">
                                <label class="col-md-5" for="login">Usuario</label>
                            </div>

                            <div class="col-md-5 controls">
                                <input name="login" id="login" type="text" class="form-control required"
                                       placeholder="Usuario" required autofocus >
                            </div>
                        </div>

                        <div class="row" style="margin-top: 20px; text-align: right">
                            <label class="col-md-5" for="pass">Contraseña</label>

                            <div class="controls col-md-5">
                                <input name="pass" id="pass" type="password" class="form-control required"
                                       placeholder="Contraseña" required style="width: 160px;">
                            </div>
                        </div>

                        <div class="divBtn" style="width: 100%; margin-top: 20px">
                            <a href="#" class="btn btn-primary btn-lg btn-block" id="btn-login"
                               style="width: 140px; margin: auto">
                                <i class="fa fa-lock"></i> Validar
                            </a>
                        </div>

                    </g:form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="btnCerrar">Cerrar</button>
                </div>
            </div>

        </div>
    </div>



<script type="text/javascript">
    var $frm = $("#frmLogin");
    var recargar = true

    function doLogin() {
        var usuario = $("#login").val();
        console.log('usuario', usuario);
        if (usuario) {
            $("#cargando").removeClass('hidden');
            $(".btn-login").replaceWith($("#cargando"));
            $("#frmLogin").submit();
        }
    }


    $(function () {

        $("#ingresar").click(function () {
            var initModalHeight = $('#modal-ingreso').outerHeight();
            $("#modalBody").css({'margin-top': ($(document).height() / 2 - 135)}, {'margin-left': $(window).width() / 2});
            $("#modal-ingreso").modal('show');
            setTimeout(function () {
                $("#login").focus();
            }, 500);

        });

        $("#btnOlvidoPass").click(function () {
            $("#recuperarPass-dialog").modal("show");
            $("#modal-ingreso").modal("hide");
        });

        // $frm.validate();
        $("#btn-login").click(function () {
            console.log('hace Login');
            doLogin();
        });

        $("#btn-pass").click(function () {
            doPass();
        });

        $("input").keyup(function (ev) {
            if (ev.keyCode == 13) {
                doLogin();
            }
        })

        // window.onload = timedRefresh(5000);
        $('#ingresar').on( "click", function() {
            $('#myModal').modal('show');
        });

        $('#btnCerrar').on( "click", function() {
            console.log('cerrar');
        });


    });

</script>

</body>
</html>