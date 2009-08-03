package propertymanagement

class Expense {
    String category
    String type
    Float amount
    Date date
    String store
    String comment

    static belongsTo = [unit:Unit]

    static constraints = {
        category()
        type()
        amount()
        date()
        store()
        comment()
    }

    static mapping = {
        columns {
            comment type: 'text'
        }
    }

    String toString() {
        "${category}, ${type}: ${date} - \$${amount}"
    }
}
