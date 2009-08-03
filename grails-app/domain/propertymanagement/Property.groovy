package propertymanagement

class Property {

    String name
    String type

    static hasMany = [units:Unit]

    static constraints = {
        name()
        type()
    }

    String toString() {
        name
    }
}
