package videojuegos
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*

class CategoriaController {

        def list() {
//        def categorias = categoria.list().sort{it.nombre}
            def categorias = Categoria.list([sort: 'nombre'])
//        println "categorias: $categorias"
            return[categorias: categorias]
        }

        def form_ajax(){
            def categoria

            if(params.id){
                categoria = Categoria.get(params.id)
            }else{
                categoria = new Categoria()
            }

            return[categoria:categoria]
        }

        def save_ajax(){
            println "guarda categoria: $params"
            def categoria

            if(params.id){
                categoria = Categoria.get(params.id)
                println('EDIT')
            }else{
                categoria = new Categoria()
                println('new')
            }

            categoria.properties = params
            if(!categoria.save(flush:true)){
                println("error al guardar la categoria " + categoria.errors)
                render "no"
            }else{
                println "errores: ${categoria.errors}"
                render "ok"
            }
        }

        def show_ajax(){
            def categoria = Categoria.get(params.id)
            return [categoria: categoria]

        }

        def delete_ajax(){

            println("Llega $params")

            def categoria = Categoria.get(params.id)
            println("Borrando $categoria")
            if( !categoria.delete(flush: true) ){
                render "ok"
            }else{
                render "error: ${categoria.error()}"
            }

        }

    def buscar() {
        println "llega a buscar: $params"
        def categorias = Categoria.findAllByNombreIlike("%" + params.crit + "%",
                [sort: 'nombre', order: 'desc'])
        println "categorias: $categorias}"
        return[categorias: categorias]
    }

    }


