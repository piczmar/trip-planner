sql = groovy.sql.Sql.newInstance(
		"jdbc:mysql://localhost/trip?autoReconnect=true",
		"grails",
		"server",
		"com.mysql.jdbc.Driver")

ddl = """
CREATE TABLE usgs_airports (
airport_id bigint(20) not null,
locid varchar(4),
feature varchar(80),
airport_name varchar(80),
state varchar(2),
county varchar(50),
latitude varchar(30),
longitude varchar(30),
primary key(airport_id)
);
"""

sql.execute(ddl)
