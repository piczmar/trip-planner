// This scripts takes input xml file, connects to PostgreSQL Db and restores airport table data
// It assumes that DB schema is alrady created and there is no automaticaly generated ID, hence it takes IDs from XML file.
// DB schema for PostgreSQl is in postgres-schema.sql, PostgreSQL driver is in /lib

if(args.size()){
	f = new File(args[0])
	println f

	// for PostgreSLQ
	sql = groovy.sql.Sql.newInstance(
			"jdbc:postgresql://localhost:5432/grails",
			"postgres",
			"secret_1",
			"org.postgresql.Driver")
	
//	// for HSQLDB
//	sql = groovy.sql.Sql.newInstance(
//		"jdbc:hsqldb:file:../prodDb;shutdown=true",
//		"sa",
//		"",
//		"org.hsqldb.jdbcDriver")

	airports = new groovy.util.XmlParser().parse(f)
	airports.airport.each{airport ->
		println "${airport.@id} -- ${airport.name.text()}"
		sql.execute(
				"insert into airport (id, version, name, city, state, country, iata, lat, lng) values(?,?,?,?,?,?,?,?,?)",
//			    "INSERT INTO AIRPORT(version, name, city, state, country, iata, lat, lng) VALUES(?,?,?,?,?,?,?,?)",
				[
					airport.@id as Integer,
					0,
					airport.name.text(),
					airport.city.text(),
					airport.state.text(),
					airport.country.text(),
					airport.iata.text(),
					airport.lat.text(),
					airport.lng.text()
				]
				)
	}
}
else{
	println "USAGE: restoreAirports [filename]"
}
