package domain
import java.text.SimpleDateFormat

class HotelStay {
	String hotel;
	Date checkIn;
	Date checkOut;
	static constraints = {
		hotel(blank: false)
		checkIn()
		checkOut()
	}
	String toString(){
		def sdf = new SimpleDateFormat("EEEE")
		"${hotel} (${sdf.format(checkIn)} to ${sdf.format(checkOut)})"
	}
}
