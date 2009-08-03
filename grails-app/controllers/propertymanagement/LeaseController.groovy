

package propertymanagement

class LeaseController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ leaseInstanceList: Lease.list( params ), leaseInstanceTotal: Lease.count() ]
    }

    def show = {
        def leaseInstance = Lease.get( params.id )

        if(!leaseInstance) {
            flash.message = "Lease not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ leaseInstance : leaseInstance ] }
    }

    def delete = {
        def leaseInstance = Lease.get( params.id )
        if(leaseInstance) {
            try {
                leaseInstance.delete(flush:true)
                flash.message = "Lease ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Lease ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Lease not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def leaseInstance = Lease.get( params.id )

        if(!leaseInstance) {
            flash.message = "Lease not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ leaseInstance : leaseInstance ]
        }
    }

    def update = {
        def leaseInstance = Lease.get( params.id )
        if(leaseInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(leaseInstance.version > version) {
                    
                    leaseInstance.errors.rejectValue("version", "lease.optimistic.locking.failure", "Another user has updated this Lease while you were editing.")
                    render(view:'edit',model:[leaseInstance:leaseInstance])
                    return
                }
            }
            leaseInstance.properties = params
            if(!leaseInstance.hasErrors() && leaseInstance.save()) {
                flash.message = "Lease ${params.id} updated"
                redirect(action:show,id:leaseInstance.id)
            }
            else {
                render(view:'edit',model:[leaseInstance:leaseInstance])
            }
        }
        else {
            flash.message = "Lease not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def leaseInstance = new Lease()
        leaseInstance.properties = params
        return ['leaseInstance':leaseInstance]
    }

    def save = {
        def leaseInstance = new Lease(params)
        if(!leaseInstance.hasErrors() && leaseInstance.save()) {
            flash.message = "Lease ${leaseInstance.id} created"
            redirect(action:show,id:leaseInstance.id)
        }
        else {
            render(view:'create',model:[leaseInstance:leaseInstance])
        }
    }
}
