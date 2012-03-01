package domain

class FlightController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [flightInstanceList: Flight.list(params), flightInstanceTotal: Flight.count()]
    }

    def create = {
        def flightInstance = new Flight()
        flightInstance.properties = params
        return [flightInstance: flightInstance]
    }

    def save = {
        def flightInstance = new Flight(params)
        if (flightInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'flight.label', default: 'Flight'), flightInstance.id])}"
            redirect(action: "show", id: flightInstance.id)
        }
        else {
            render(view: "create", model: [flightInstance: flightInstance])
        }
    }

    def show = {
        def flightInstance = Flight.get(params.id)
        if (!flightInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])}"
            redirect(action: "list")
        }
        else {
            [flightInstance: flightInstance]
        }
    }

    def edit = {
        def flightInstance = Flight.get(params.id)
        if (!flightInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [flightInstance: flightInstance]
        }
    }

    def update = {
        def flightInstance = Flight.get(params.id)
        if (flightInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (flightInstance.version > version) {
                    
                    flightInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'flight.label', default: 'Flight')] as Object[], "Another user has updated this Flight while you were editing")
                    render(view: "edit", model: [flightInstance: flightInstance])
                    return
                }
            }
            flightInstance.properties = params
            if (!flightInstance.hasErrors() && flightInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'flight.label', default: 'Flight'), flightInstance.id])}"
                redirect(action: "show", id: flightInstance.id)
            }
            else {
                render(view: "edit", model: [flightInstance: flightInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def flightInstance = Flight.get(params.id)
        if (flightInstance) {
            try {
                flightInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])}"
            redirect(action: "list")
        }
    }
}
