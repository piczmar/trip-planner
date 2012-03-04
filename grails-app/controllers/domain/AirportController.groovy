package domain

import grails.converters.JSON
import grails.converters.XML

class AirportController {

	def scaffold = Airport
	def geocoderService // Spring injects the service into the controller automatically
	// if you define a member variable with the same name as the service

	def index = {
		switch(request.method){
			case "POST":
				def airport = new Airport()
				airport.iata = request.XML.@iata
				airport.name = request.XML."official-name"
				airport.city = request.XML.city
				airport.state = request.XML.state
				airport.country = request.XML.country
				airport.lat = request.XML.location.@latitude
				airport.lng = request.XML.location.@longitude
				if(airport.save()){
					response.status = 201 // Created
					render airport as XML
				}
				else{
					response.status = 500 //Internal Server Error
					render "Could not create new Airport due to errors:\n ${airport.errors}"
				}
				break
			case "GET":
				if(params.iata){
					render Airport.findByIata(params.iata) as XML
				}
				else{
					render Airport.list() as XML
				}
				break
			case "PUT":
				def airport = Airport.findByIata(request.XML.@iata as String)
				airport.name = request.XML."official-name"
				airport.city = request.XML.city
				airport.state = request.XML.state
				airport.country = request.XML.country
				airport.lat = request.XML.location.@latitude
				airport.lng = request.XML.location.@longitude
				if(airport.save()){
					response.status = 200 // OK
					render airport as XML
				}
				else{
					response.status = 500 //Internal Server Error
					render "Could not create new Airport due to errors:\n ${airport.errors}"
				}
				break
			case "DELETE":
				if(params.iata){
					def airport = Airport.findByIata(params.iata)
					if(airport){
						airport.delete()
						render "Successfully Deleted."
					}
					else{
						response.status = 404 //Not Found
						render "${params.iata} not found."
					}
				}
				else{
					response.status = 400 //Bad Request
					render """DELETE request must include the IATA code
							Example: /rest/airport/iata
							"""
				}
				break
		}
	}
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

	def debugAccept = {
		def clientRequest = request.getHeader("accept")
		def serverResponse = request.format
		render "Client: ${clientRequest}\nServer: ${serverResponse}\n"
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

	def list = {
		if(!params.max) params.max = 10
		def list = Airport.list(params)
		withFormat{
			html{
				params.max = Math.min(params.max ? params.int('max') : 10, 100)
				return [airportInstanceList: list, airportInstanceTotal: Airport.count()]
			}
			xml{ render list as XML }
		}
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

					airportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'airport.label', default: 'Airport')]
					as Object[], "Another user has updated this Airport while you were editing")
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
