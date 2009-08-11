

package propertymanagement

class PaymentController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ paymentInstanceList: Payment.list( params ), paymentInstanceTotal: Payment.count() ]
    }

    def show = {
        def paymentInstance = Payment.get( params.id )

        if(!paymentInstance) {
            flash.message = "Payment not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ paymentInstance : paymentInstance ] }
    }

    def delete = {
        def paymentInstance = Payment.get( params.id )
        if(paymentInstance) {
            try {
                paymentInstance.delete(flush:true)
                flash.message = "Payment ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Payment ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Payment not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def paymentInstance = Payment.get( params.id )

        if(!paymentInstance) {
            flash.message = "Payment not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ paymentInstance : paymentInstance ]
        }
    }

    def update = {
        def paymentInstance = Payment.get( params.id )
        if(paymentInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(paymentInstance.version > version) {
                    
                    paymentInstance.errors.rejectValue("version", "payment.optimistic.locking.failure", "Another user has updated this Payment while you were editing.")
                    render(view:'edit',model:[paymentInstance:paymentInstance])
                    return
                }
            }
            paymentInstance.properties = params
            if(!paymentInstance.hasErrors() && paymentInstance.save()) {
                flash.message = "Payment ${params.id} updated"
                redirect(action:show,id:paymentInstance.id)
            }
            else {
                render(view:'edit',model:[paymentInstance:paymentInstance])
            }
        }
        else {
            flash.message = "Payment not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def paymentInstance = new Payment()
        paymentInstance.properties = params
        return ['paymentInstance':paymentInstance]
    }

    def save = {
        def paymentInstance = new Payment(params)
        if(!paymentInstance.hasErrors() && paymentInstance.save()) {
            flash.message = "Payment ${paymentInstance.id} created"
            redirect(action:show,id:paymentInstance.id)
        }
        else {
            render(view:'create',model:[paymentInstance:paymentInstance])
        }
    }
}
