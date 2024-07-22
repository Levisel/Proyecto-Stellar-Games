package videojuegos

class Pago {

    Cliente cliente
    Videojuego videojuego
    BigDecimal monto
    Date fecha
    String estado

    static mapping = {
        table 'pago'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'pag_id'
        id generator: 'identity'
        version false
        columns {
            id column: 'pag_id'
            cliente column: 'cli_id'
            videojuego column: 'vid_id'
            monto column: 'pag_monto'
            fecha column: 'pag_fecha'
            estado column: 'estado'
        }
    }

    static constraints = {
        monto(nullable: false, min: 0.0)
        fecha(nullable: false)
        estado(inList: ['Pendiente', 'Pagado', 'Cancelado'])
    }

    String toString() {
        return "${this.id}: ${this.cliente.nombre} ${this.cliente.apellido} ${this.videojuego.nombre}"
    }
}
