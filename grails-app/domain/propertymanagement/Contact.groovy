package propertymanagement

class Contact {
	String type
	String phoneNumber
	String emailAddress

	static belongsTo = [person:Person]

    static constraints = {
		type()
		phoneNumber()
		emailAddress()
    }

	String toString() {
		"${type}: ${( type == 'email' ) ? emailAddress : phoneNumber}"
	}
}
