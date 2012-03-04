package domain

import grails.converters.JSON
import grails.converters.XML

class AirportController {

	def scaffold = Airport
	def geocoderService // Spring injects the service into the controller automatically
						// if you define a member variable with the same name as the service
	
	def getXML = {
		render Airport.findByIata(params.iata) as XML
	}
	def xmlList= {
		render Airport.list() as XML
	}
	// Create custom XML in form:
	//<airports>
	//	<airport id="1" iata="den">
	//	<official-name>Denver International Airport</official-name>
	//	<city>Denver</city>
	//	...
	//	</airport>
	//...
	//</airports>
	def customXmlList = {
		def list = Airport.list()
		render(contentType:"text/xml"){
			airports{
				for(a in list){
					airport(id:a.id, iata:a.iata){
						"official-name"(a.name)
						city(a.city)
						state(a.state)
						country(a.country)
						location(latitude:a.lat, longitude:a.lng)
					}
				}
			}
		}
	}
	def xmlShow = {
		render Airport.findById(params.id) as XML
	}
	def getJson = {
		def airports = Airport.findByIata(params.iata)
		if(!airports){
			airports = new Airport(iata: params.iata , name: "Not found")
		}
		render airports as JSON
	}

	def geocode = {
		def result = geocoderService.geocodeAirport(params.iata)
		render result as JSON
	}

    def save = {
		def results = geocoderService.geocodeAirport(params.iata)
        def airportInstance = new Airport(params + results) // This line combines the results HashMap with the params HashMap. 
															// (Yes, merging two HashMaps in Groovy is as simple as adding them together.)
        if (airportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'airport.label', default: 'Airport'), airportInstance.id])}"
            redirect(action: "show", id: airportInstance.id)
        }
        else {
            render(view: "create", model: [airportInstance: airportInstance])
        }
    }
	
    def update = {
        def airportInstance = Airport.get(params.id)
        if (airportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (airportInstance.version > version) {
                    
                    airportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'airport.label', default: 'Airport')] as Object[], "Another user has updated this Airport while you were editing")
                    render(view: "edit", model: [airportInstance: airportInstance])
                    return
                }
            }
			def results = geocoderService.geocodeAirport(params.iata)
            airportInstance.properties = params + results
            if (!airportInstance.hasErrors() && airportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'airport.label', default: 'Airport'), airportInstance.id])}"
                redirect(action: "show", id: airportInstance.id)
            }
            else {
                render(view: "edit", model: [airportInstance: airportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'airport.label', default: 'Airport'), params.id])}"
            redirect(action: "list")
        }
    }  
	
	
	def map = {
		[airportList: Airport.list()]
	}
}
