package propertymanagement

class Payment {
	
	Float amount
	
	Date dateReceived
	
	String receivedFrom
	
	static belongsTo = [receivable:Receivable]
	
    static constraints = {
    	receivable()
    	amount()
    	dateReceived()
    	receivedFrom() 	
    }
}
