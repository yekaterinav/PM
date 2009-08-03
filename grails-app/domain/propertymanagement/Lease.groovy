package propertymanagement

class Lease {
    String type
    Date beginDate
    Date endDate
    Float deposit
    Float rent
    Date dueDate
    Date lateDate
    Float lateFee
    String comment

    static hasMany = [tenants:Tenant]
    static belongsTo = Tenant

    static constraints = {
        type()
        beginDate()
        endDate()
        deposit()
        rent()
        dueDate()
        lateDate()
        lateFee()
        comment()
    }

    static mapping = {
        comment type: 'text'
    }
}
