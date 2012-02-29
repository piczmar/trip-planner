package trip.planner

class DateTagLib {
	def currYear = {
		out << Calendar.getInstance().get(Calendar.YEAR)
	}
}
