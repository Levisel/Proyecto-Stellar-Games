<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="main">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!--------------CONTENIDO------------------------------------------------------------------------------------------------------>
<div class="container my-5">
    <div class="carrito-items">
        <ul id="carrito-lista">
            <!-- Mostrar los elementos del carrito aquí -->
        </ul>
        <p id="precio">Total: $0.00</p>
    </div>

    <!-- Tabla de Factura -->
    <div class="mt-5">
        <h3>Detalle de Factura</h3>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Precio</th>
            </tr>
            </thead>
            <tbody id="factura-detalle">
            <!-- Mostrar el detalle de la factura aquí -->
            </tbody>
            <tfoot>
            <tr>
                <th colspan="2">Total</th>
                <th id="factura-total">$0.00</th>
            </tr>
            </tfoot>
        </table>
    </div>

    <button id="openModalButton" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#vaciarCarritoModal">Comprar</button>

    <!-- Modal -->
    <div class="modal fade" id="vaciarCarritoModal" tabindex="-1" aria-labelledby="vaciarCarritoModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="vaciarCarritoModalLabel">Comprar Suscripción</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Por favor, ingrese su cédula de identidad (CI):</p>
                    <input type="text" class="form-control" id="cedula" maxlength="10" pattern="[0-9]*">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button id="comprar-button" type="button" class="btn btn-info">Aceptar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!--------------FIN DEL CONTENIDO------------------------------------------------------------------------------------------------------>

<!-SCRIPT PARA MANEJAR CARRITO->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        var cartItemsContainer = $('#carrito-lista');
        var totalPriceElement = $('#precio');
        var facturaDetalle = $('#factura-detalle');
        var facturaTotal = $('#factura-total');
        var cartCount = $('#cart-count'); // Elemento del contador del carrito

        // Mostrar un mensaje si el carrito está vacío
        function mostrarMensajeCarritoVacio() {
            if (cartItemsContainer.children().length === 0) {
                var emptyCartMessage = $('<p>').text('El carrito está vacío... ¡Puedes comprar videojuegos en la sección de Categorías!');
                cartItemsContainer.append(emptyCartMessage);
            }
        }

        // Llamar a la función para mostrar el mensaje de carrito vacío después de un breve retraso
        setTimeout(mostrarMensajeCarritoVacio, 10);

        // Cargar y mostrar elementos del carrito desde localStorage
        function mostrarElementosCarrito() {
            var carrito = JSON.parse(localStorage.getItem('cart')) || [];

            var totalPrice = 0;
            cartItemsContainer.empty(); // Limpiar los elementos previos del carrito
            facturaDetalle.empty(); // Limpiar los detalles previos de la factura
            var cartItemCount = 0; // Inicializar el contador del carrito

            $.each(carrito, function(index, item) {
                var listItem = $('<li>');
                var itemName = $('<span>').text(item.title);
                var itemPrice = $('<span>').text('$' + (item.price * (item.quantity || 1)).toFixed(2)); // Calcular el precio total
                var itemQuantity = $('<span>').text('x ' + (item.quantity || 1)); // Mostrar la cantidad
                var increaseButton = $('<button>').text('+');
                var decreaseButton = $('<button>').text('-');
                var deleteButton = $('<button>');

                // Aplicar estilos
                listItem.addClass('product-item');
                itemName.addClass('item-name');
                itemPrice.addClass('item-price');
                itemQuantity.addClass('item-quantity');
                increaseButton.addClass('boton-aumentar');
                decreaseButton.addClass('boton-disminuir');
                deleteButton.addClass('delete-button');

                var trashIcon = $('<i>').addClass('fas fa-trash'); // Clases de Font Awesome

                // ICONO
                deleteButton.append(trashIcon);

                listItem.append(itemName, itemPrice, itemQuantity, increaseButton, decreaseButton, deleteButton);
                cartItemsContainer.append(listItem);

                increaseButton.on('click', function() {
                    // Verificar si el producto ya existe en el carrito
                    var existingItem = carrito.find(existing => existing.title === item.title);

                    if (existingItem) {
                        // Si el producto ya existe, aumentar su cantidad
                        existingItem.quantity = (existingItem.quantity || 1) + 1;
                        cartItemCount++; // Incrementar el contador del carrito
                    }

                    // Actualizar el carrito en el almacenamiento local
                    localStorage.setItem('cart', JSON.stringify(carrito));
                    actualizarContadorCarrito(cartItemCount); // Actualizar el contador del carrito en la vista
                    mostrarElementosCarrito(); // Volver a mostrar los elementos del carrito
                });

                decreaseButton.on('click', function() {
                    if (item.quantity && item.quantity > 1) {
                        item.quantity -= 1;
                        cartItemCount--; // Decrementar el contador del carrito
                    } else {
                        // Si la cantidad es 1 o menos, eliminar el producto del carrito
                        carrito.splice(index, 1);
                    }

                    // Actualizar el carrito en el almacenamiento local
                    localStorage.setItem('cart', JSON.stringify(carrito));
                    actualizarContadorCarrito(cartItemCount); // Actualizar el contador del carrito en la vista
                    mostrarElementosCarrito(); // Volver a mostrar los elementos del carrito
                    mostrarMensajeCarritoVacio();
                });

                deleteButton.on('click', function() {
                    // Eliminar el producto del carrito
                    carrito.splice(index, 1);
                    cartItemCount -= item.quantity || 1; // Decrementar el contador del carrito
                    // Actualizar el carrito en el almacenamiento local
                    localStorage.setItem('cart', JSON.stringify(carrito));
                    actualizarContadorCarrito(cartItemCount); // Actualizar el contador del carrito en la vista
                    mostrarElementosCarrito(); // Volver a mostrar los elementos del carrito
                    mostrarMensajeCarritoVacio();
                });

                // Agregar los detalles del producto a la tabla de factura
                var facturaRow = $('<tr>');
                var facturaProducto = $('<td>').text(item.title);
                var facturaCantidad = $('<td>').text(item.quantity || 1);
                var facturaTotalItem = $('<td>').text('$' + (item.price * (item.quantity || 1)).toFixed(2));

                facturaRow.append(facturaProducto, facturaCantidad, facturaTotalItem);
                facturaDetalle.append(facturaRow);

                totalPrice += item.price * (item.quantity || 1);
                cartItemCount += item.quantity || 1; // Incrementar el contador del carrito
            });

            // Actualizar el precio total en la interfaz
            totalPriceElement.text('Total: $' + totalPrice.toFixed(2));
            facturaTotal.text('$' + totalPrice.toFixed(2)); // Actualizar el total en la tabla de factura

            // Actualizar el contador del carrito en la vista
            actualizarContadorCarrito(cartItemCount);
        }

        // Actualizar el contador del carrito en la vista y en el almacenamiento local
        function actualizarContadorCarrito(count) {
            cartCount.text(count); // Actualizar el contador del carrito en la vista
            localStorage.setItem('cartItemCount', count); // Actualizar el contador del carrito en el almacenamiento local
        }

        mostrarElementosCarrito();

        // Escuchar el evento personalizado para actualizar el carrito
        $(window).on('cartUpdated', mostrarElementosCarrito);
    });
</script>

<!-SCRIPT PARA MANEJAR COMPRA->
<script>
    $('#comprar-button').on('click', function() {
        // Obtener datos del carrito desde localStorage
        var cart = JSON.parse(localStorage.getItem('cart')) || [];
        var cartItemCount = parseInt(localStorage.getItem('cartItemCount')) || 0;
        const fechaHoy = new Date().toISOString();

        // Obtener la cédula del cliente
        var cedula = $('#cedula').val(); // Recuperar el valor de la cédula correspondiente del modal

        // Obtener el ID del cliente usando la cédula
        $.ajax({
            url: "${createLink(controller: 'cliente', action: 'getClienteIdByCedula')}",
            type: 'GET',
            data: { cedula: cedula },
            success: function(clienteId) {
                // Iterar sobre los elementos del carrito
                cart.forEach(function(item) {
                    // Crear un objeto json con los datos del pago
                    var pagoData = {
                        cliente: clienteId, // Usar el ID del cliente
                        videojuego: item.id,
                        monto: item.price * item.quantity,
                        fecha: fechaHoy,
                        estado: 'Pagado'
                    };

                    // Realizar solicitud AJAX para guardar el pago
                    $.ajax({
                        url: "${createLink(controller: 'pago', action: 'save_ajax')}",
                        type: 'POST',
                        data: pagoData,
                        success: function(response) {
                            console.log(response); // Mostrar respuesta del servidor en la consola
                            window.location.href = "${createLink(controller: 'inicio', action: 'compra')}";
                            vaciarCarrito();
                        },
                        error: function(xhr, status, error) {
                            console.error(error); // Mostrar cualquier error en la consola
                        }
                    });
                });
            },
            error: function(xhr, status, error) {
                console.error("Error al obtener el ID del cliente: " + error);
            }
        });
    });

    function vaciarCarrito() {
        // Vaciar el carrito en el localStorage
        localStorage.removeItem('cart');
        localStorage.removeItem('cartItemCount');
    }
</script>

</body>
</html>
