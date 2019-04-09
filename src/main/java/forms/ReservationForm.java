package forms;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import domain.ControlPoint;
import domain.LuggageSize;
import domain.Route;


public class ReservationForm {
	
	public ReservationForm() {
		super();
	}

	private Route				route;
	private ControlPoint		origin;
	private ControlPoint		destination;
	private Integer				requestedSeats;
	private LuggageSize			luggageSize;
	private Integer				availableSeats;
	
	@NotNull
	@Valid
	public Route getRoute() {
		return route;
	}
	
	public void setRoute(Route route) {
		this.route = route;
	}
	
	@NotNull
	@Valid
	public ControlPoint getOrigin() {
		return origin;
	}
	
	public void setOrigin(ControlPoint origin) {
		this.origin = origin;
	}
	
	@NotNull
	@Valid
	public ControlPoint getDestination() {
		return destination;
	}
	
	public void setDestination(ControlPoint destination) {
		this.destination = destination;
	}
	
	@NotNull
	@Min(1)
	public Integer getRequestedSeats() {
		return requestedSeats;
	}
	
	public void setRequestedSeats(Integer requestedSeats) {
		this.requestedSeats = requestedSeats;
	}
	
	@NotNull
	@Valid
	public LuggageSize getLuggageSize() {
		return luggageSize;
	}
	
	public void setLuggageSize(LuggageSize luggageSize) {
		this.luggageSize = luggageSize;
	}
	
	public Integer getAvailableSeats() {
		return availableSeats;
	}
	
	public void setAvailableSeats(Integer availableSeats) {
		this.availableSeats = availableSeats;
	}

}
