package com.example.hibernate;

import javax.persistence.*;

@Entity
@Table(name = "usgs_airports_annot")
public class AirportAnnotated {
	private long id;
	private String name;
	private String iata;
	private String state;
	private String lat;
	private String lng;

	@Id
	@Column(name = "airport_id", nullable = false)
	public long getId() {
		return id;
	}

	@Column(name = "airport_name", nullable = false)
	public String getName() {
		return name;
	}

	@Column(name = "locid", nullable = false)
	public String getIata() {
		return iata;
	}

	@Column(name = "state", nullable = false)
	public String getState() {
		return state;
	}

	@Column(name = "latitude", nullable = false)
	public String getLat() {
		return lat;
	}

	@Column(name = "longitude", nullable = false)
	public String getLng() {
		return lng;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setIata(String iata) {
		this.iata = iata;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}
}