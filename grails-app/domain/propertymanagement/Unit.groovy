package propertymanagement

class Unit {
    String name
//    boolean primary

    Integer bedrooms
    Float bathrooms

    Address address

	static hasMany = [tenants:Tenant, expenses:Expense, leads:Lead]
	static belongsTo = [property:Property]

    static constraints = {
		property( nullable: true )

        name()
//        primary()
        bedrooms()
        bathrooms()

		address( nullable: true )
		tenants()
        expenses()
        leads()
    }

    String toString() {
        "${name}: ${address}"
    }
}
