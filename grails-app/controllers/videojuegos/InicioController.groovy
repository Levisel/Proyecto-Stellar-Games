package videojuegos

class InicioController {

    def index() { }

    def home() { }

    def contacto(){ }

    def categorias(){
        def categorias = Categoria.list([sort: 'nombre'])
//        println "categorias: $categorias"
        return[categorias: categorias]
    }

    def secciones () {
            println "llega a lista de categorias: $params"
//        def cantones = Canton.list([sort: 'nombre'])
            def categoria = Categoria.get(params.id)
            def videojuegos = Videojuego.findAllByCategoria(categoria, [sort: 'nombre'])
            println "juegos: $videojuegos de cat: ${categoria?.id}"
            return[videojuegos: videojuegos, categoria: categoria?.id]
    }

    def carrito() {}

    def compra() {}

}
