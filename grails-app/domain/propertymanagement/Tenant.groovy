package propertymanagement

class Tenant extends Person {
	Date moveInDate
	Date moveOutDate

    static hasMany = [leases:Lease]
	static belongsTo = [unit:Unit]

    static constraints = {
		unit()
		moveInDate()
		moveOutDate()
        leases( nullable: true )
    }

	String toString() {
		"${firstName} ${lastName} - ${contacts}"
	}
}
