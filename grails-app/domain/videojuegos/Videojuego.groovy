package videojuegos

class Videojuego {
    String nombre
    BigDecimal precio
    Categoria categoria
    String imagen

    static mapping = {
        table 'videojuego'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'vid_id'
        id generator:  'identity'
        version false
        columns {
            id column: 'vid_id'
            nombre column: 'vid_nombre'
            precio column: 'vid_precio'
            imagen column:  'vid_imagen'
            categoria column: 'cat_id'
        }
    }

    static constraints = {
        nombre(size: 1..100, blank: false, nullable: false)
        precio scale: 2, nullable: false, min: 0.01
        imagen(size: 1..2000, blank: false, nullable: false)
        categoria(nullable: false)
    }

    String toString() {
        this.nombre
    }
}
