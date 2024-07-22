package videojuegos

class Categoria {
    String nombre

    static mapping = {
        table 'categoria'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'cat_id'
        id generator:  'identity'
        version false
        columns {
            id column: 'cat_id'
            nombre column: 'cat_nombre'
        }
    }

    static constraints = {
        nombre(size: 1..50, blank: false, nullable: false)
    }

    String toString() {
        this.nombre
    }
}
