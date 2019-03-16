
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;

import security.UserAccount;

@Entity
@Access(AccessType.PROPERTY)
//@Table(uniqueConstraints = {@UniqueConstraint(columnNames = "userAccount")})
public class Actor extends DomainEntity {    //Attributes   

	private String		name;

	private String		surname;

	private String		email;

	private UserAccount	userAccount;


	public String getName() {

		return this.name;

	}
	@NotBlank
	public String getSurname() {

		return this.surname;

	}
	@URL
	@NotBlank
	public String getEmail() {

		return this.email;

	}

	@Valid
	@OneToOne(cascade = CascadeType.ALL)
	public UserAccount getUserAccount() {

		return this.userAccount;

	}    //Setters    public void setName(final String name) {
	public void setName(final String name) {

		this.name = name;

	}
	public void setSurname(final String surname) {

		this.surname = surname;

	}
	public void setEmail(final String email) {

		this.email = email;

	}

	public void setUserAccount(final UserAccount userAccount) {

		this.userAccount = userAccount;

	}

}
