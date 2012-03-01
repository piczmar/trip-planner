package domain

class Trip {
	static constraints = { name() }
	static hasMany = [flights: Flight];
	String name
	String toString() {
		name
	}
}
