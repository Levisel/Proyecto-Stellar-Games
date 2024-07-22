package videojuegos

class ClienteController {

    def list() {
        def clientes = Cliente.list([sort: 'nombre'])
        return[clientes: clientes]
    }

    def form_ajax(){
        def cliente

        if(params.id){
            cliente = Cliente.get(params.id)
        }else{
            cliente = new Cliente()
        }

        return[cliente:cliente]
    }

    def save_ajax(){
        println "guarda cliente: $params"
        def cliente

        if(params.id && params.id.toInteger() != 0){
            cliente = Cliente.get(params.id)
            println('EDIT')
        }else{
            cliente = new Cliente()
            println('new')
        }

        cliente.properties = params
        if(!cliente.save(flush:true)){
            println("error al guardar la cliente " + cliente.errors)
            render "no"
        }else{
            println "errores: ${cliente.errors}"
            render "ok"
        }
    }

    def show_ajax(){
        def cliente = Cliente.get(params.id)
        return [cliente: cliente]

    }

    def delete_ajax(){

        println("Llega $params")

        def cliente = Cliente.get(params.id)
        println("Borrando $cliente")
        if( !cliente.delete(flush: true) ){
            render "ok"
        }else{
            render "error: ${cliente.error()}"
        }

    }


    def buscar() {
        println "llega a buscar: $params"
        def nombre = Cliente.findAllByNombreIlike("%" + params.crit + "%",
                [sort: 'nombre', order: 'desc'])
        return [clientes: nombre]
    }

    def getClienteIdByCedula() {
        String cedula = params.cedula
        def cliente = Cliente.findByCedula(cedula)

        if (cliente) {
            render cliente.id
        } else {
            render status: 404, text: 'Cliente no encontrado'
        }
    }

}
