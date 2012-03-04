if(args.size()){
	f = new File(args[0])
	println f

	sql = groovy.sql.Sql.newInstance(
			"jdbc:mysql://localhost/trip?autoReconnect=true",
			"grails",
			"server",
			"com.mysql.jdbc.Driver")

	FeatureCollection = new groovy.util.XmlParser().parse(f)
	ogr = new groovy.xml.Namespace("http://ogr.maptools.org/")
	gml = new groovy.xml.Namespace("http://www.opengis.net/gml")

	FeatureCollection[gml.featureMember][ogr.airprtx020].each{airprtx020 ->
		println "${airprtx020[ogr.LOCID].text()} -- ${airprtx020[ogr.NAME].text()}"
		points = airprtx020[ogr.geometryProperty][gml.Point][gml.coordinates].text().split(",")

		sql.execute(
				"insert into usgs_airports (airport_id, locid, feature, airport_name, state, county, latitude, longitude) values(?,?,?,?,?,?,?,?)",
				[
					airprtx020[ogr.AIRPRTX020].text(),
					airprtx020[ogr.LOCID].text(),
					airprtx020[ogr.FEATURE].text(),
					airprtx020[ogr.NAME].text(),
					airprtx020[ogr.STATE].text(),
					airprtx020[ogr.COUNTY].text(),
					points[1],
					points[0]]
				)
	}
}
else{
	println "USAGE: restoreAirports [filename]"
}