package videojuegos

import grails.converters.JSON

class VideojuegoController {

    def list() {
//        def videojuegos = Videojuego.list().sort{it.nombre}
        def videojuegos = Videojuego.list([sort: 'nombre'])
//        println "videojuegos: $videojuegos"
        return[videojuegos: videojuegos]
    }

    def form_ajax(){
        def videojuego

        if(params.id){
            videojuego = Videojuego.get(params.id)
        }else{
            videojuego = new Videojuego()
        }

        def categorias = Categoria.list()

        return[videojuego:videojuego, categorias: categorias]
    }

    def save_ajax(){
        println "guarda videojuego: $params"
        def videojuego

        if(params.id && params.id.toInteger() != 0){
            videojuego = Videojuego.get(params.id)
            println('EDIT')
        }else{
            videojuego = new Videojuego()
            println('new')
        }

        videojuego.properties = params
        if(!videojuego.save(flush:true)){
            println("error al guardar la videojuego " + videojuego.errors)
            render "no"
        }else{
            println "errores: ${videojuego.errors}"
            render "ok"
        }
    }

    def show_ajax(){
        def videojuego = Videojuego.get(params.id)
        return [videojuego: videojuego]

    }

    def delete_ajax(){

        println("Llega $params")

        def videojuego = Videojuego.get(params.id)
        println("Borrando $videojuego")
        if( !videojuego.delete(flush: true) ){
            render "ok"
        }else{
            render "error: ${videojuego.error()}"
        }

    }


    def buscar() {
        println "llega a buscar: $params"
        def videojuegos = Videojuego.findAllByNombreIlike("%" + params.crit + "%",
                [sort: 'nombre', order: 'desc'])
        println "videojuegos: $videojuegos}"
        return[videojuegos: videojuegos]
    }


    def mostrarPorCategoria() {
        def categoria = Categoria.get(params.categoriaId)
        def videojuegos = Videojuego.findAllByCategoria(categoria, [sort: 'nombre'])
        render(view: "mostrarPorCategoria", model: [videojuegos: videojuegos, categoria: categoria])
    }


    def obtenerCategorias() {
        def categorias = Categoria.list(sort: 'nombre')
        render categorias as JSON
    }


}
