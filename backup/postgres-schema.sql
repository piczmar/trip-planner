-- Table: airline

-- DROP TABLE airline;

CREATE TABLE airline
(
  id bigint NOT NULL,
  version bigint NOT NULL,
  frequent_flier character varying(255) NOT NULL,
  iata character varying(3) NOT NULL,
  name character varying(255) NOT NULL,
  CONSTRAINT airline_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE airline
  OWNER TO postgres;

-- Table: airport

-- DROP TABLE airport;

CREATE TABLE airport
(
  id bigint NOT NULL,
  version bigint NOT NULL,
  city character varying(255) NOT NULL,
  country character varying(255) NOT NULL,
  iata character varying(3) NOT NULL,
  lat character varying(255) NOT NULL,
  lng character varying(255) NOT NULL,
  name character varying(255) NOT NULL,
  state character varying(2) NOT NULL,
  CONSTRAINT airport_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE airport
  OWNER TO postgres;

-- Table: flight

-- DROP TABLE flight;

CREATE TABLE flight
(
  id bigint NOT NULL,
  version bigint NOT NULL,
  airline_id bigint NOT NULL,
  arrival_airport_id bigint NOT NULL,
  arrival_date timestamp without time zone NOT NULL,
  departure_airport_id bigint NOT NULL,
  departure_date timestamp without time zone NOT NULL,
  flight_number character varying(255) NOT NULL,
  trip_id bigint NOT NULL,
  CONSTRAINT flight_pkey PRIMARY KEY (id ),
  CONSTRAINT fkb43184704c331e96 FOREIGN KEY (arrival_airport_id)
      REFERENCES airport (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkb4318470b04f9ebb FOREIGN KEY (departure_airport_id)
      REFERENCES airport (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkb4318470bd8c99b0 FOREIGN KEY (airline_id)
      REFERENCES airline (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkb4318470c44df6a4 FOREIGN KEY (trip_id)
      REFERENCES trip (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE flight
  OWNER TO postgres;

-- Table: trip

-- DROP TABLE trip;

CREATE TABLE trip
(
  id bigint NOT NULL,
  version bigint NOT NULL,
  name character varying(255) NOT NULL,
  CONSTRAINT trip_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE trip
  OWNER TO postgres;

