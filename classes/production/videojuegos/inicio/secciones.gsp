<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="main">
    <title>Title</title>
</head>
<body>
<div class="container my-5">
    <!---CONTENIDO-->
    <div class="container">
        <section class="products">
            <h2>Videojuegos de ${videojuegos.categoria.join(', ')}:</h2>
            <div class="all-products">
                <!-- Este es el contenedor donde se cargarán los productos desde la Base de Datos -->
                <div id="items" class="items-style">
                    <g:if test="${videojuegos.size() > 0}">
                        <div class="products">
                            <g:each in="${videojuegos}" var="videojuego">
                                <div class="product" style="background-image: url('${videojuego?.imagen}'); background-color: transparent" !important>
                                    <div class="product-title"> ${videojuego?.nombre}</div>
                                    <div class="product-price">${videojuego?.precio}</div>
                                    <a class="comprar-button mt-2" data-id="${videojuego?.id}">Comprar</a>
                                </div>
                            </g:each>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="danger">
                            <td class="text-center" colspan="2">
                                No se encontraron registros que mostrar
                            </td>
                        </div>
                    </g:else>
                </div>
            </div>
        </section>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('.comprar-button').on('click', function() {
            // Obtener la información del producto asociado al botón
            var productId = $(this).data('id');
            var productName = $(this).siblings('.product-title').text();
            var productPrice = parseFloat($(this).siblings('.product-price').text().replace('$', '')); // Convertir el precio a número
            var cantidad = 1; // Cantidad inicial

            // Verificar si el producto ya está en el carrito
            var cart = JSON.parse(localStorage.getItem('cart')) || [];
            var existingItem = cart.find(item => item.id === productId);
            if (existingItem) {
                // Si el producto ya está en el carrito, aumenta su cantidad
                existingItem.quantity++;
            } else {
                // Si el producto no está en el carrito, agrega un nuevo elemento al carrito
                var cartItem = {
                    id: productId,
                    title: productName,
                    price: productPrice,
                    quantity: cantidad
                };
                cart.push(cartItem);
            }

            // Actualiza el carrito en el localStorage
            localStorage.setItem('cart', JSON.stringify(cart));

            // Actualiza el contador del carrito en la vista
            var cartItemCount = cart.reduce((total, item) => total + item.quantity, 0);
            localStorage.setItem('cartItemCount', cartItemCount);
            $('#cart-count').text(cartItemCount);
        });
    });
</script>
</body>
</html>
