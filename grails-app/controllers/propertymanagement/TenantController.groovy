

package propertymanagement

class TenantController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ tenantInstanceList: Tenant.list( params ), tenantInstanceTotal: Tenant.count() ]
    }

    def show = {
        def tenantInstance = Tenant.get( params.id )

        if(!tenantInstance) {
            flash.message = "Tenant not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ tenantInstance : tenantInstance ] }
    }

    def delete = {
        def tenantInstance = Tenant.get( params.id )
        if(tenantInstance) {
            try {
                tenantInstance.delete(flush:true)
                flash.message = "Tenant ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Tenant ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Tenant not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def tenantInstance = Tenant.get( params.id )

        if(!tenantInstance) {
            flash.message = "Tenant not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ tenantInstance : tenantInstance ]
        }
    }

    def update = {
        def tenantInstance = Tenant.get( params.id )
        if(tenantInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(tenantInstance.version > version) {
                    
                    tenantInstance.errors.rejectValue("version", "tenant.optimistic.locking.failure", "Another user has updated this Tenant while you were editing.")
                    render(view:'edit',model:[tenantInstance:tenantInstance])
                    return
                }
            }
            tenantInstance.properties = params
            if(!tenantInstance.hasErrors() && tenantInstance.save()) {
                flash.message = "Tenant ${params.id} updated"
                redirect(action:show,id:tenantInstance.id)
            }
            else {
                render(view:'edit',model:[tenantInstance:tenantInstance])
            }
        }
        else {
            flash.message = "Tenant not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def tenantInstance = new Tenant()
        tenantInstance.properties = params
        return ['tenantInstance':tenantInstance]
    }

    def save = {
        def tenantInstance = new Tenant(params)
        if(!tenantInstance.hasErrors() && tenantInstance.save()) {
            flash.message = "Tenant ${tenantInstance.id} created"
            redirect(action:show,id:tenantInstance.id)
        }
        else {
            render(view:'create',model:[tenantInstance:tenantInstance])
        }
    }
}
