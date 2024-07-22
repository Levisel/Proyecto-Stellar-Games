package videojuegos

class PagoController {

    def list() {
        def pagos = Pago.list()
        return[pagos: pagos]
    }

    def form_ajax(){
        def pago
        def estadosDisponibles = ['Pendiente', 'Pagado', 'Cancelado']

        if(params.id){
            pago = Pago.get(params.id)
        }else{
            pago = new Pago()
        }

        def clientes = Cliente.list()
        def videojuegos = Videojuego.list()

        return [pago: pago, clientes: clientes, videojuegos: videojuegos, estadosDisponibles: estadosDisponibles]
    }


    def save_ajax(){
        println "guarda pago: $params"
        def pago

        if(params.id && params.id.toInteger() != 0){
            pago = Pago.get(params.id)
            println('EDIT')
        }else{
            pago = new Pago()
            println('new')
        }

        pago.properties = params
        if(!pago.save(flush:true)){
            println("error al guardar el pago " + pago.errors)
            render "no"
        }else{
            println "errores: ${pago.errors}"
            render "ok"
        }
    }

    def show_ajax(){
        def pago = Pago.get(params.id)
        return [pago: pago]

    }

    def delete_ajax(){

        println("Llega $params")

        def pago = Pago.get(params.id)
        println("Borrando $pago")
        if( !pago.delete(flush: true) ){
            render "ok"
        }else{
            render "error: ${pago.error()}"
        }

    }


    def buscar() {
        println "llega a buscar: $params"
        def estados = Pago.findAllByEstadoIlike("%" + params.crit + "%",
                [sort: 'estado', order: 'desc'])
        return [pagos: estados]
    }

}
