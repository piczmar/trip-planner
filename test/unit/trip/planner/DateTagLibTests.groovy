package trip.planner

import grails.test.*

class DateTagLibTests extends TagLibUnitTestCase {

	def dateTagLib

	// mocked "out" for taglib
	StringWriter out

	/** Setup metaclass fixtures for mocking. */
	void setUp() {
		out = new StringWriter()
		DateTagLib.metaClass.out = out
		dateTagLib = new DateTagLib()
	}

	/** Remove metaclass fixtures for mocking. */
	void tearDown() {
		def remove = GroovySystem.metaClassRegistry.&removeMetaClass
		remove DateTagLib
	}

	void testThisYear() {
		String expected = Calendar.getInstance().get(Calendar.YEAR).toString()
		assertEquals("the years don't match", expected, dateTagLib.currYear().toString())
	}
}
