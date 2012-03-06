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

	void testCopyright(){
		dateTagLib.copyright startYear: '2002', { 'FakeCo Inc.' }
		assertEquals  "<div id='copyright'>&copy; 2002 - 2012, FakeCo Inc. All Rights Reserved.</div>", dateTagLib.out.toString()
	}
	void testHeadingWithNoLevelAndNoContent() {
		dateTagLib.heading [:], {''}
		assertEquals '<h1></h1>', dateTagLib.out.toString()
	}

	void testHeadingWithLevelAndSimpleContent() {
		dateTagLib.heading level: '2', {'simple'}
		assertEquals '<h2>simple</h2>', dateTagLib.out.toString()
	}

	void testCustomDateFormatWithEmptyFormat(){
		def date = "2012-02-01 20:10:02";
		dateTagLib.customDateFormat format: "", {date}
		assertEquals("02/01/2012", dateTagLib.out.toString())
	}
	
	void testCustomDateFormatWithFormat(){
		def date = "2012-02-01 20:10:02";
		def customFormat = "MM-dd-yyyy";
		dateTagLib.customDateFormat format: customFormat, {date}
		assertEquals("02-01-2012", dateTagLib.out.toString())
	}
}
