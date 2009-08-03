

package propertymanagement

class ExpenseController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ expenseInstanceList: Expense.list( params ), expenseInstanceTotal: Expense.count() ]
    }

    def show = {
        def expenseInstance = Expense.get( params.id )

        if(!expenseInstance) {
            flash.message = "Expense not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ expenseInstance : expenseInstance ] }
    }

    def delete = {
        def expenseInstance = Expense.get( params.id )
        if(expenseInstance) {
            try {
                expenseInstance.delete(flush:true)
                flash.message = "Expense ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Expense ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Expense not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def expenseInstance = Expense.get( params.id )

        if(!expenseInstance) {
            flash.message = "Expense not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ expenseInstance : expenseInstance ]
        }
    }

    def update = {
        def expenseInstance = Expense.get( params.id )
        if(expenseInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(expenseInstance.version > version) {
                    
                    expenseInstance.errors.rejectValue("version", "expense.optimistic.locking.failure", "Another user has updated this Expense while you were editing.")
                    render(view:'edit',model:[expenseInstance:expenseInstance])
                    return
                }
            }
            expenseInstance.properties = params
            if(!expenseInstance.hasErrors() && expenseInstance.save()) {
                flash.message = "Expense ${params.id} updated"
                redirect(action:show,id:expenseInstance.id)
            }
            else {
                render(view:'edit',model:[expenseInstance:expenseInstance])
            }
        }
        else {
            flash.message = "Expense not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def expenseInstance = new Expense()
        expenseInstance.properties = params
        return ['expenseInstance':expenseInstance]
    }

    def save = {
        def expenseInstance = new Expense(params)
        if(!expenseInstance.hasErrors() && expenseInstance.save()) {
            flash.message = "Expense ${expenseInstance.id} created"
            redirect(action:show,id:expenseInstance.id)
        }
        else {
            render(view:'create',model:[expenseInstance:expenseInstance])
        }
    }
}
