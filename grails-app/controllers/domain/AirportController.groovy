package domain

import grails.converters.JSON;
import grails.converters.XML
import java.util.TreeMap.AscendingSubMap.AscendingEntrySetView;

class AirportController {

	def scaffold = Airport
	def geocoderService // Spring injects the service into the controller automatically
						// if you define a member variable with the same name as the service
	
	def getXML = {
		render Airport.findByIata(params.iata) as XML
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
}
