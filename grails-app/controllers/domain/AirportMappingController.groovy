package domain

import grails.converters.JSON

class AirportMappingController {

	def scaffold = AirportMapping

	def iata = {
		def iata = params.id?.toUpperCase() ?: "NO IATA"
		def airport = AirportMapping.findByIata(iata)
		if(!airport){
			airport = new AirportMapping(iata:iata, name:"Not found")
		}
		render airport as JSON
	}
}
