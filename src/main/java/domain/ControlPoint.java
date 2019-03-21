
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class ControlPoint extends DomainEntity {

	//Attributes

	private String	text;

	//Relationships

	private Route	route;


	//Getters

	@NotBlank
	public String getText() {
		return this.text;
	}

	@Valid
	@NotNull
	@ManyToOne(optional = false)
	public Route getRoute() {
		return this.route;
	}

	//Setters

	public void setText(final String text) {
		this.text = text;
	}

	public void setRoute(final Route route) {
		this.route = route;
	}
}
