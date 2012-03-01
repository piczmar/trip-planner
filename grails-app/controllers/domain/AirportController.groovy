package domain

import grails.converters.JSON;
import grails.converters.XML
import java.util.TreeMap.AscendingSubMap.AscendingEntrySetView;

class AirportController {

	def scaffold = Airport
	
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
}
