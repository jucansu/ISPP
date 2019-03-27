
package domain;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.joda.time.LocalTime;
import org.springframework.format.annotation.DateTimeFormat;

public class Finder {

	//Atributos

	private Date		departureDate;
	private String		origin;
	private LocalTime	originTime;
	private String		destination;
	private LocalTime	destinationTime;
	private VehicleType	vehicleType;
	private Integer		availableSeats;
	private LuggageSize	luggageSize;
	private Boolean		pets;
	private Boolean		childs;
	private Boolean		smoke;
	private Boolean		music;


	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	public LocalTime getOriginTime() {
		return this.originTime;
	}

	public void setOriginTime(final LocalTime originTime) {
		this.originTime = originTime;
	}

	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	public LocalTime getDestinationTime() {
		return this.destinationTime;
	}

	public void setDestinationTime(final LocalTime destinationTime) {
		this.destinationTime = destinationTime;
	}

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

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	public Date getDepartureDate() {
		return this.departureDate;
	}

	public void setDepartureDate(final Date departureDate) {
		this.departureDate = departureDate;
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

	public Integer getAvailableSeats() {
		return this.availableSeats;
	}

	public void setAvailableSeats(final Integer availableSeats) {
		this.availableSeats = availableSeats;
	}

	public LuggageSize getLuggageSize() {
		return this.luggageSize;
	}

	public void setLuggageSize(final LuggageSize luggageSize) {
		this.luggageSize = luggageSize;
	}

}
