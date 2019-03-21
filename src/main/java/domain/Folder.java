
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Folder extends DomainEntity {

	//Attributes

	private String				name;
	private boolean				system;

	//Relationships

	private Actor				actor;
	private Collection<Letter>	messages;


	//Getter

	@NotBlank
	public String getName() {
		return this.name;
	}

	public boolean isSystem() {
		return this.system;
	}

	@Valid
	@NotNull
	@ManyToOne(optional = false)
	public Actor getActor() {
		return this.actor;
	}

	@Valid
	@ManyToMany
	public Collection<Letter> getMessages() {
		return this.messages;
	}

	//Setter

	public void setName(final String name) {
		this.name = name;
	}

	public void setSystem(final boolean system) {
		this.system = system;
	}

	public void setActor(final Actor actor) {
		this.actor = actor;
	}

	public void setMessages(final Collection<Letter> messages) {
		this.messages = messages;
	}
}
