package domain

class Airline {
	static hasMany = [trip: Trip]
	String name
	String url
	String frequentFlyer
	String notes
}
