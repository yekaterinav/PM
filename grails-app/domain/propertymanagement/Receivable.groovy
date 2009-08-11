package propertymanagement

class Receivable {
	
	String type
	
	Float amount
	
	Date dueDate
	
	static belongsTo = [unit:Unit]
	
	static hasMany = [payment:Payment]
	
    static constraints = {
    	type()
    	amount()
    	dueDate()
    }
}
