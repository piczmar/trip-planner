package domain

class Trip {
	static belongsTo = [airline: Airline]// deleting an Airline would leave Trip records that point back to a nonexistent parent
	String name
	String city
	Date startDate
	Date endDate
	String purpose
	String notes
	Airline airline
}
