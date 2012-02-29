package trip.planner

class DateTagLib {
	
	static namespace = 'trip'
	
	def currYear = {
		out << Calendar.getInstance().get(Calendar.YEAR)
	}
	
	def copyright = { attrs, body ->
		def startYear = attrs.startYear
		out << "<div id='copyright'>"
		out << "&copy; $startYear - ${currYear()}, "<< body()
		out << " All Rights Reserved."
		out << "</div>"
	}
	
	def heading = { attrs, body ->
		def level = attrs.level ?: 1
		out << "<h$level>" << body() << "</h$level>"
	}
}
