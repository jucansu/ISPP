
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Passenger extends Actor {

	//Attributes
	private Double				cash;
	private CreditCard			creditCard;
	private String				bankAccountNumber;

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
	public CreditCard getCreditCard() {
		return this.creditCard;
	}

	@NotBlank
	//	@Pattern(regexp = "/^ES[0-9]{22}$/", message = "Invalid Spain Bank Number")
	public String getBankAccountNumber() {
		return this.bankAccountNumber;
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

	public void setReserves(final Collection<Reserve> reserves) {
		this.reserves = reserves;
	}

	public void setComments(final Collection<Comment> comments) {
		this.comments = comments;
	}

	public void setCreditCard(final CreditCard creditCard) {
		this.creditCard = creditCard;
	}

	public void setBankAccountNumber(final String bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
	}

}
