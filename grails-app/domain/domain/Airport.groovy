package domain

class Airport {
	static constraints = {
		name(nullable: false, blank: false)
		iata(maxSize:3)
		city()
		state(maxSize:2)
		country()
	}

	String name
	String iata
	String city
	String state
	String country = "US"
	String lat
	String lng
	
	String toString(){
		"${iata} - ${name}"
	}
}
