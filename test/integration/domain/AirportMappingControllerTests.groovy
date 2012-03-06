package domain

import grails.test.*

class AirportMappingControllerTests extends ControllerUnitTestCase {
	protected void setUp() {
		super.setUp()
		//mockForConstraintsTests(AirportMapping)
		//mockForConstraintsTests(AirportMappingController)
	}

	protected void tearDown() {
		super.tearDown()
	}
	void testWithBadIata(){
		def controller = new AirportMappingController()
		// use Groovy metaprogramming to override the getParams method directly, 
		// forcing the expected values to be present in the HashMap that's returned
		controller.metaClass.getParams = {
			->
			return ["id":"foo"]
		}
		controller.iata()
		def response = controller.response.contentAsString
		assertTrue response.contains("\"name\":\"Not found\"")
		println "Response for airport/iata/foo: ${response}"
	}
	void testWithGoodIata(){
		def controller = new AirportMappingController()
		controller.metaClass.getParams = {
			->
			return ["id":"den"]
		}
		controller.iata()
		def response = controller.response.contentAsString
		assertTrue response.contains("Denver")
		println "Response for airport/iata/den: ${response}"
	}
}
