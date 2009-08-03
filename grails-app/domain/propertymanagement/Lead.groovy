package propertymanagement

class Lead {
    String name
    // TODO: is this really a string? or should it be a Contact object?
    String contact
    Date date
    String comment

    static belongsTo = [unit:Unit]

    static constraints = {
        name()
        contact()
        date()
        comment()
        unit( nullable: true )
    }

    static mappings = {
        columns {
            comment type: 'text'
        }
    }

    String toString() {
        "${name}, ${contact}, ${date}, ${comment}"
    }
}
