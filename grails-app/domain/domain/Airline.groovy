package domain

class Airline {
	static constraints = {
		name()
		url()
		frequentFlyer()
		notes()
	  }
	static hasMany = [trip: Trip]
	String name
	String url
	String frequentFlyer
	String notes
	
	String toString() {
		return name
	}
	
}
