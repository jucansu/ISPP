
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


	private Route			route;
	private ControlPoint	origin;
	private ControlPoint	destination;
	private Integer			requestedSeats;
	private LuggageSize		luggageSize;
	private Integer			availableSeats;

	private String			stripeToken;
	private String			stripeEmail;
	private String			stripeTokenType;


	@NotNull
	@Valid
	public Route getRoute() {
		return this.route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	@NotNull
	@Valid
	public ControlPoint getOrigin() {
		return this.origin;
	}

	public void setOrigin(ControlPoint origin) {
		this.origin = origin;
	}

	@NotNull
	@Valid
	public ControlPoint getDestination() {
		return this.destination;
	}

	public void setDestination(ControlPoint destination) {
		this.destination = destination;
	}

	@NotNull
	@Min(1)
	public Integer getRequestedSeats() {
		return this.requestedSeats;
	}

	public void setRequestedSeats(Integer requestedSeats) {
		this.requestedSeats = requestedSeats;
	}

	@NotNull
	@Valid
	public LuggageSize getLuggageSize() {
		return this.luggageSize;
	}

	public void setLuggageSize(LuggageSize luggageSize) {
		this.luggageSize = luggageSize;
	}

	public Integer getAvailableSeats() {
		return this.availableSeats;
	}

	public void setAvailableSeats(Integer availableSeats) {
		this.availableSeats = availableSeats;
	}

	public String getStripeToken() {
		return this.stripeToken;
	}

	public void setStripeToken(String stripeToken) {
		this.stripeToken = stripeToken;
	}

	public String getStripeEmail() {
		return this.stripeEmail;
	}

	public void setStripeEmail(String stripeEmail) {
		this.stripeEmail = stripeEmail;
	}

	public String getStripeTokenType() {
		return this.stripeTokenType;
	}

	public void setStripeTokenType(String stripeTokenType) {
		this.stripeTokenType = stripeTokenType;
	}

}
