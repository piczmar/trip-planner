package domain

import grails.test.*
import java.text.SimpleDateFormat

class HotelStayTests extends GrailsUnitTestCase {
	protected void setUp() {
		super.setUp()
	}

	protected void tearDown() {
		super.tearDown()
	}
	void testToString() {
		def h = new HotelStay(hotel:"Hilton")
		def df = new SimpleDateFormat("MM/dd/yyyy")
		h.checkIn = df.parse("10/1/2008")
		h.checkOut = df.parse("10/5/2008")
		println h
		assertToString h, "Hilton (Wednesday to Sunday)"
	}

	void testBlankHotel(){
		mockForConstraintsTests(HotelStay)
		def h = new HotelStay(hotel:"")
		assertFalse "there should be errors", h.validate()
		assertTrue "another way to check for errors after you call validate()", h.hasErrors()

		println "\nErrors:"
		println h.errors ?: "no errors found"

		def badField = h.errors.getFieldError('hotel')
		println "\nBadField:"
		println badField ?: "hotel wasn't a bad field"
		assertNotNull "I'm expecting to find an error on the hotel field", badField


		def code = badField?.codes.find {it == 'hotelStay.hotel.blank'}
		println "\nCode:"
		println code ?: "the blank hotel code wasn't found"
		assertNotNull "the blank hotel field should be the culprit", code
	}
}
