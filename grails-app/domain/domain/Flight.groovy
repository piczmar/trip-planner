package domain

class Flight {
	static constraints = {
		flightNumber()
		airline()
		departureDate()
		departureAirport()
		arrivalDate()
		arrivalAirport()
	}

	static belongsTo = [trip:Trip, airline:Airline]
	String flightNumber
	Date departureDate
	Airport departureAirport // by not giving 'belongsTo'constraint when deleting an Airport won't cascade down 
							 // to the associated Flight, whereas deleting a Trip or an Airline will
	Date arrivalDate
	Airport arrivalAirport
}
