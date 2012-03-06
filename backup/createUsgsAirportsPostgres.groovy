// for PostgreSLQ
sql = groovy.sql.Sql.newInstance(
		"jdbc:postgresql://localhost:5432/grails",
		"postgres",
		"secret_1",
		"org.postgresql.Driver")

ddl = """
CREATE TABLE usgs_airports
(
  airport_id bigint NOT NULL,
  locid character varying(4),
  feature character varying(80),
  county character varying(255),
  latitude character varying(255),
  longitude character varying(255),
  airport_name character varying(255),
  state character varying(2),
  CONSTRAINT usgs_airports_pkey PRIMARY KEY (airport_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE usgs_airports
  OWNER TO postgres;
"""

sql.execute(ddl)