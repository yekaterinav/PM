

package propertymanagement

class ReceivableController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ receivableInstanceList: Receivable.list( params ), receivableInstanceTotal: Receivable.count() ]
    }

    def show = {
        def receivableInstance = Receivable.get( params.id )

        if(!receivableInstance) {
            flash.message = "Receivable not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ receivableInstance : receivableInstance ] }
    }

    def delete = {
        def receivableInstance = Receivable.get( params.id )
        if(receivableInstance) {
            try {
                receivableInstance.delete(flush:true)
                flash.message = "Receivable ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Receivable ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Receivable not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def receivableInstance = Receivable.get( params.id )

        if(!receivableInstance) {
            flash.message = "Receivable not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ receivableInstance : receivableInstance ]
        }
    }

    def update = {
        def receivableInstance = Receivable.get( params.id )
        if(receivableInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(receivableInstance.version > version) {
                    
                    receivableInstance.errors.rejectValue("version", "receivable.optimistic.locking.failure", "Another user has updated this Receivable while you were editing.")
                    render(view:'edit',model:[receivableInstance:receivableInstance])
                    return
                }
            }
            receivableInstance.properties = params
            if(!receivableInstance.hasErrors() && receivableInstance.save()) {
                flash.message = "Receivable ${params.id} updated"
                redirect(action:show,id:receivableInstance.id)
            }
            else {
                render(view:'edit',model:[receivableInstance:receivableInstance])
            }
        }
        else {
            flash.message = "Receivable not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def receivableInstance = new Receivable()
        receivableInstance.properties = params
        return ['receivableInstance':receivableInstance]
    }

    def save = {
        def receivableInstance = new Receivable(params)
        if(!receivableInstance.hasErrors() && receivableInstance.save()) {
            flash.message = "Receivable ${receivableInstance.id} created"
            redirect(action:show,id:receivableInstance.id)
        }
        else {
            render(view:'create',model:[receivableInstance:receivableInstance])
        }
    }
}
