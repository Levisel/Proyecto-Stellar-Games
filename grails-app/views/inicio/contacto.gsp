<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="main">
    <title>Title</title>
</head>
<body>
<div class="container my-5">
    <section class="bg-light py-5">
        <div class="container px-5 my-5">
            <div class="text-center mb-5" style="text-align: center !important;">
                <div class="feature bg-info bg-gradient text-white rounded-3 mb-3"><i class="bi bi-star"></i></div>
                <h2 class="fw-bolder">Contacta con nosotros</h2>
                <p class="lead mb-0">Nos encantaría saber de ti</p>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-10 d-flex flex-column align-items-center text-center" style="justify-content: center !important;">
                    <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                        <!-- Name input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                            <label for="name">Nombre completo</label>
                            <div class="invalid-feedback" data-sb-feedback="name:required">Se requiere un nombre.</div>
                        </div>
                        <!-- Email address input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                            <label for="email">Correo electrónico</label>
                            <div class="invalid-feedback" data-sb-feedback="email:required">Se requiere un correo electrónico.</div>
                            <div class="invalid-feedback" data-sb-feedback="email:email">Correo electrónico no es válido.</div>
                        </div>
                        <!-- Phone number input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                            <label for="phone">Número de teléfono</label>
                            <div class="invalid-feedback" data-sb-feedback="phone:required">Se requiere un teléfono.</div>
                        </div>
                        <!-- Message input-->
                        <div class="form-floating mb-3">
                            <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                            <label for="message">Mensaje</label>
                            <div class="invalid-feedback" data-sb-feedback="message:required">Se requiere un mensaje.</div>
                        </div>
                        <!-- Submit Button-->
                        <div class="d-grid"><button class="btn btn-primary btn-lg" id="submitButton" type="submit">Enviar</button></div>
                    </form>
                </div>
            </div>
        </div>
    </section>

</div>


</body>

</html>