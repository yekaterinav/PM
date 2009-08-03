

package propertymanagement

class LeadController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ leadInstanceList: Lead.list( params ), leadInstanceTotal: Lead.count() ]
    }

    def show = {
        def leadInstance = Lead.get( params.id )

        if(!leadInstance) {
            flash.message = "Lead not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ leadInstance : leadInstance ] }
    }

    def delete = {
        def leadInstance = Lead.get( params.id )
        if(leadInstance) {
            try {
                leadInstance.delete(flush:true)
                flash.message = "Lead ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Lead ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Lead not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def leadInstance = Lead.get( params.id )

        if(!leadInstance) {
            flash.message = "Lead not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ leadInstance : leadInstance ]
        }
    }

    def update = {
        def leadInstance = Lead.get( params.id )
        if(leadInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(leadInstance.version > version) {
                    
                    leadInstance.errors.rejectValue("version", "lead.optimistic.locking.failure", "Another user has updated this Lead while you were editing.")
                    render(view:'edit',model:[leadInstance:leadInstance])
                    return
                }
            }
            leadInstance.properties = params
            if(!leadInstance.hasErrors() && leadInstance.save()) {
                flash.message = "Lead ${params.id} updated"
                redirect(action:show,id:leadInstance.id)
            }
            else {
                render(view:'edit',model:[leadInstance:leadInstance])
            }
        }
        else {
            flash.message = "Lead not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def leadInstance = new Lead()
        leadInstance.properties = params
        return ['leadInstance':leadInstance]
    }

    def save = {
        def leadInstance = new Lead(params)
        if(!leadInstance.hasErrors() && leadInstance.save()) {
            flash.message = "Lead ${leadInstance.id} created"
            redirect(action:show,id:leadInstance.id)
        }
        else {
            render(view:'create',model:[leadInstance:leadInstance])
        }
    }
}
