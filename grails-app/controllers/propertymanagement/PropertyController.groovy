

package propertymanagement

class PropertyController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ propertyInstanceList: Property.list( params ), propertyInstanceTotal: Property.count() ]
    }

    def show = {
        def propertyInstance = Property.get( params.id )

        if(!propertyInstance) {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ propertyInstance : propertyInstance ] }
    }

    def delete = {
        def propertyInstance = Property.get( params.id )
        if(propertyInstance) {
            try {
                propertyInstance.delete(flush:true)
                flash.message = "Property ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Property ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def propertyInstance = Property.get( params.id )

        if(!propertyInstance) {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ propertyInstance : propertyInstance ]
        }
    }

    def update = {
        def propertyInstance = Property.get( params.id )
        if(propertyInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(propertyInstance.version > version) {
                    
                    propertyInstance.errors.rejectValue("version", "property.optimistic.locking.failure", "Another user has updated this Property while you were editing.")
                    render(view:'edit',model:[propertyInstance:propertyInstance])
                    return
                }
            }
            propertyInstance.properties = params
            if(!propertyInstance.hasErrors() && propertyInstance.save()) {
                flash.message = "Property ${params.id} updated"
                redirect(action:show,id:propertyInstance.id)
            }
            else {
                render(view:'edit',model:[propertyInstance:propertyInstance])
            }
        }
        else {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def propertyInstance = new Property()
        propertyInstance.properties = params
        return ['propertyInstance':propertyInstance]
    }

    def save = {
        def propertyInstance = new Property(params)
        if(!propertyInstance.hasErrors() && propertyInstance.save()) {
            flash.message = "Property ${propertyInstance.id} created"
            redirect(action:show,id:propertyInstance.id)
        }
        else {
            render(view:'create',model:[propertyInstance:propertyInstance])
        }
    }
}
