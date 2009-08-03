package propertymanagement

class Person {
	String firstName
	String lastName
	// ???

	static hasMany = [contacts:Contact]

    static constraints = {
		firstName()
		lastName()
		contacts( nullable: true )
    }
}
