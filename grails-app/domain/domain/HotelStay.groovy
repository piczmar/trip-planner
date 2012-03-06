package domain
import java.text.SimpleDateFormat

class HotelStay {
	String hotel;
	Date checkIn;
	Date checkOut;
	static constraints = {
		hotel(blank: false)
		checkIn()
		checkOut(validator:{val, obj->	//The val variable is the current field. The obj variable represents the current HotelStay instance.
			return val.after(obj.checkIn) 
		})
	}
	String toString(){
		def sdf = new SimpleDateFormat("EEEE")
		"${hotel} (${sdf.format(checkIn)} to ${sdf.format(checkOut)})"
	}
}
