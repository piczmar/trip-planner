package trip.planner
import java.text.SimpleDateFormat

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
	def customDateFormat = {attrs, body ->
		def b = attrs.body ?: body()
		def d = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(b.toString())

		//if no format attribute is supplied, use this
		def pattern = attrs["format"] ?: "MM/dd/yyyy"
		out << new SimpleDateFormat(pattern).format(d)
	}
}
