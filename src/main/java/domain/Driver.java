
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Driver extends Actor {

	//Attributes
	private Double				cash;
	private CreditCard			creditCard;
	private String				bankAccountNumber;
	private Boolean				pets;
	private Boolean				smoke;
	private Boolean				music;
	private Boolean				childs;

	//Relationships
	private Collection<Route>	routes;
	private Collection<Comment>	comments;
	private Collection<Vehicle>	vehicles;


	//Getter

	@Min(value = 0)
	public Double getCash() {
		return this.cash;
	}

	@Valid
	@NotNull
	public CreditCard getCreditCard() {
		return this.creditCard;
	}

	@NotBlank
	@Pattern(regexp = "/^ES/d{22}$/", message = "Invalid Spain Bank Number")
	public String getBankAccountNumber() {
		return this.bankAccountNumber;
	}

	@NotNull
	public Boolean getPets() {
		return this.pets;
	}

	@NotNull
	public Boolean getSmoke() {
		return this.smoke;
	}

	@NotNull
	public Boolean getMusic() {
		return this.music;
	}

	@NotNull
	public Boolean getChilds() {
		return this.childs;
	}

	@Valid
	@NotNull
	@OneToMany(mappedBy = "driver")
	public Collection<Route> getRoutes() {
		return this.routes;
	}

	@Valid
	@NotNull
	@OneToMany(mappedBy = "driver")
	public Collection<Comment> getComments() {
		return this.comments;
	}

	@Valid
	@NotNull
	@OneToMany(mappedBy = "driver")
	public Collection<Vehicle> getVehicles() {
		return this.vehicles;
	}

	//Setter

	public void setCash(final Double cash) {
		this.cash = cash;
	}

	public void setCreditCard(final CreditCard creditCard) {
		this.creditCard = creditCard;
	}

	public void setPets(final Boolean pets) {
		this.pets = pets;
	}

	public void setSmoke(final Boolean smoke) {
		this.smoke = smoke;
	}

	public void setMusic(final Boolean music) {
		this.music = music;
	}

	public void setBankAccountNumber(final String bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
	}

	public void setChilds(final Boolean childs) {
		this.childs = childs;
	}

	public void setRoutes(final Collection<Route> routes) {
		this.routes = routes;
	}

	public void setComments(final Collection<Comment> comments) {
		this.comments = comments;
	}

	public void setVehicles(final Collection<Vehicle> vehicles) {
		this.vehicles = vehicles;
	}
}
