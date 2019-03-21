
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class Driver extends Actor {

	//Attributes
	private Double				cash;
	private CreditCard			creditCard;
	private Boolean				pets;
	private Boolean				smoke;
	private Boolean				music;
	private Boolean				childs;

	//Relationships
	private Collection<Reserve>	reserves;
	private Collection<Comment>	comments;


	//Getter

	@Min(value = 0)
	public Double getCash() {
		return this.cash;
	}

	@Valid
	@NotNull
	@OneToOne(mappedBy = "passenger")
	public CreditCard getCreditCard() {
		return this.creditCard;
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
	@OneToMany(mappedBy = "passenger")
	public Collection<Reserve> getReserves() {
		return this.reserves;
	}

	@Valid
	@NotNull
	@OneToMany(mappedBy = "passenger")
	public Collection<Comment> getComments() {
		return this.comments;
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

	public void setChilds(final Boolean childs) {
		this.childs = childs;
	}

	public void setReserves(final Collection<Reserve> reserves) {
		this.reserves = reserves;
	}

	public void setComments(final Collection<Comment> comments) {
		this.comments = comments;
	}

}
