
package domain;

import org.joda.time.LocalDateTime;
import org.joda.time.LocalTime;

public class Finder {

	//Atributos

	private LocalDateTime	departureDate;
	private LocalTime		arrivalTime;
	private String			origin;
	private String			destination;
	private VehicleType		vehicleType;
	private Integer			aviableSeats;
	private LuggageSize		luggageSize;
	private Boolean			pets;
	private Boolean			childs;
	private Boolean			smoke;
	private Boolean			music;


	public Boolean getPets() {
		return this.pets;
	}

	public void setPets(final Boolean pets) {
		this.pets = pets;
	}

	public Boolean getChilds() {
		return this.childs;
	}

	public void setChilds(final Boolean childs) {
		this.childs = childs;
	}

	public Boolean getSmoke() {
		return this.smoke;
	}

	public void setSmoke(final Boolean smoke) {
		this.smoke = smoke;
	}

	public Boolean getMusic() {
		return this.music;
	}

	public void setMusic(final Boolean music) {
		this.music = music;
	}

	public LocalDateTime getDepartureDate() {
		return this.departureDate;
	}

	public void setDepartureDate(final LocalDateTime departureDate) {
		this.departureDate = departureDate;
	}

	public LocalTime getArrivalTime() {
		return this.arrivalTime;
	}

	public void setArrivalTime(final LocalTime arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getOrigin() {
		return this.origin;
	}

	public void setOrigin(final String origin) {
		this.origin = origin;
	}

	public String getDestination() {
		return this.destination;
	}

	public void setDestination(final String destination) {
		this.destination = destination;
	}

	public VehicleType getVehicleType() {
		return this.vehicleType;
	}

	public void setVehicleType(final VehicleType vehicleType) {
		this.vehicleType = vehicleType;
	}

	public Integer getAviableSeats() {
		return this.aviableSeats;
	}

	public void setAviableSeats(final Integer aviableSeats) {
		this.aviableSeats = aviableSeats;
	}

	public LuggageSize getLuggageSize() {
		return this.luggageSize;
	}

	public void setLuggageSize(final LuggageSize luggageSize) {
		this.luggageSize = luggageSize;
	}

}
