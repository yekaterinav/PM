

package propertymanagement

class UnitController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ unitInstanceList: Unit.list( params ), unitInstanceTotal: Unit.count() ]
    }

    def show = {
        def unitInstance = Unit.get( params.id )

        if(!unitInstance) {
            flash.message = "Unit not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ unitInstance : unitInstance ] }
    }

    def delete = {
        def unitInstance = Unit.get( params.id )
        if(unitInstance) {
            try {
                unitInstance.delete(flush:true)
                flash.message = "Unit ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Unit ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Unit not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def unitInstance = Unit.get( params.id )

        if(!unitInstance) {
            flash.message = "Unit not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ unitInstance : unitInstance ]
        }
    }

    def update = {
        def unitInstance = Unit.get( params.id )
        if(unitInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(unitInstance.version > version) {
                    
                    unitInstance.errors.rejectValue("version", "unit.optimistic.locking.failure", "Another user has updated this Unit while you were editing.")
                    render(view:'edit',model:[unitInstance:unitInstance])
                    return
                }
            }
            unitInstance.properties = params
            if(!unitInstance.hasErrors() && unitInstance.save()) {
                flash.message = "Unit ${params.id} updated"
                redirect(action:show,id:unitInstance.id)
            }
            else {
                render(view:'edit',model:[unitInstance:unitInstance])
            }
        }
        else {
            flash.message = "Unit not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def unitInstance = new Unit()
        unitInstance.properties = params
        return ['unitInstance':unitInstance]
    }

    def save = {
        def unitInstance = new Unit(params)
        if(!unitInstance.hasErrors() && unitInstance.save()) {
            flash.message = "Unit ${unitInstance.id} created"
            redirect(action:show,id:unitInstance.id)
        }
        else {
            render(view:'create',model:[unitInstance:unitInstance])
        }
    }
}
