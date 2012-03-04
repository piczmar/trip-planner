// This file prints content of airpost table on screen, run this script with:
// groovy -classpath /path/to/hsqldb.jar;. backupAirports.groovy
// You can redirect output to file like:
// groovy -classpath /path/to/hsqldb.jar;. backupAirports.groovy >> airposts.xml
//
//def url = "jdbc:hsqldb:file:prodDb;shutdown=true"
//def username = "sa"
//def password = ""
//def driverClassName = "org.hsqldb.jdbcDriver"
//sql = groovy.sql.Sql.newInstance(url,username,password,driverClassName)
// 
// x = new groovy.xml.MarkupBuilder()
// 
// x.airports{
//   sql.eachRow("select * from airport order by id"){ row ->
//	 airport(id:row.id){
//	   version(row.version)
//	   name(row.name)
//	   city(row.city)
//	   state(row.state)
//	   country(row.country)
//	   iata(row.iata)
//	   lat(row.lat)
//	   lng(row.lng)
//	 }
//   }
// }

// For MySQL
sql = groovy.sql.Sql.newInstance(
   "jdbc:mysql://localhost/trip?autoReconnect=true",
   "grails",
   "server",
   "com.mysql.jdbc.Driver")

x = new groovy.xml.MarkupBuilder()

x.airports{
  sql.eachRow("select * from airport order by id"){ row ->
	airport(id:row.id){
	  version(row.version)
	  name(row.name)
	  city(row.city)
	  state(row.state)
	  country(row.country)
	  iata(row.iata)
	  lat(row.lat)
	  lng(row.lng)
	}
  }
}