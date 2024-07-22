package videojuegos

class Cliente {

    String cedula
    String nombre
    String apellido
    String email
    String direccion
    String telefono

    static mapping = {
        table 'cliente'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'cli_id'
        id generator: 'identity'
        version false
        columns {
            id column: 'cli_id'
            cedula column: 'cli_cedula'
            nombre column: 'cli_nombre'
            apellido column: 'cli_apellido'
            email column: 'cli_email'
            direccion column: 'cli_direccion'
            telefono column: 'cli_telefono'
        }
    }

    static constraints = {
        cedula(blank:false, nullable: false, unique: true)
        nombre(blank: false, nullable: false, maxSize: 50)
        apellido(blank: false, nullable: false, maxSize: 50)
        email(blank: false, nullable: false, email: true, maxSize: 255, unique: true)
        direccion(nullable: true, maxSize: 100)
        telefono(nullable: true, maxSize: 10)
    }

    String toString() {
        return this.nombre
    }
}
