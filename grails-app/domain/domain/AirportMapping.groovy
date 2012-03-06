package domain

class AirportMapping {
	static constraints = {
		name(nullable: false, blank: false)
		iata(maxSize:4)
		state(maxSize:2)
		lat()
		lng()
	}

	static mapping = {
		table "usgs_airports"
		version false	// table does not have a version column.
		columns {
			id column: "airport_id"
			name column: "airport_name"
			iata column: "locid"
			state column: "state"
			lat column: "latitude"
			lng column: "longitude"
		}
	}

	String name
	String iata
	//String city
	String state
	//String country = "US"
	String lat
	String lng

	String toString(){
		"${iata} - ${name}"
	}

}
