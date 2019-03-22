
package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Letter extends DomainEntity {

	//Attributes

	private Date		moment;
	private String		subject;
	private String		body;
	private String		priority;
	private Boolean		isReport;
	private TypeAlert	alertType;

	//Relationship

	private Actor		sender;
	private Actor		recipient;
	private Folder		folder;


	//Getters

	@NotNull
	@Past
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getMoment() {
		return this.moment;
	}

	@NotBlank
	public String getSubject() {
		return this.subject;
	}

	@NotBlank
	public String getBody() {
		return this.body;
	}

	@NotBlank
	@Pattern(regexp = "HIGH|NEUTRAL|LOW")
	public String getPriority() {
		return this.priority;
	}

	@NotNull
	public Boolean getIsReport() {
		return this.isReport;
	}

	@Valid
	@NotNull
	public TypeAlert getAlertType() {
		return this.alertType;
	}
	@NotNull
	@Valid
	@ManyToOne(optional = false)
	public Folder getFolder() {
		return this.folder;
	}

	@NotNull
	@Valid
	@ManyToOne(optional = false)
	public Actor getSender() {
		return this.sender;
	}

	@NotNull
	@Valid
	@ManyToOne(optional = false)
	public Actor getRecipient() {
		return this.recipient;
	}

	//Setters

	public void setMoment(final Date moment) {
		this.moment = moment;
	}

	public void setPriority(final String priority) {
		this.priority = priority;
	}
	public void setSubject(final String subject) {
		this.subject = subject;
	}

	public void setBody(final String body) {
		this.body = body;
	}

	public void setIsReport(final Boolean isReport) {
		this.isReport = isReport;
	}

	public void setFolder(final Folder folder) {
		this.folder = folder;
	}

	public void setAlertType(final TypeAlert alertType) {
		this.alertType = alertType;
	}

	public void setSender(final Actor sender) {
		this.sender = sender;
	}

	public void setRecipient(final Actor recipient) {
		this.recipient = recipient;
	}

}
