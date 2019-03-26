
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class ControlPoint extends DomainEntity implements Comparable<ControlPoint>{

	//Attributes

	private String	location;
	private Integer arrivalOrder;
	private Integer arrivalTime;
	private Double 	distance;

	//Relationships
	private Route	route;


	//Getters

	@NotBlank
	public String getLocation() {
		return this.location;
	}

	@Valid
	@NotNull
	@ManyToOne(optional = false)
	public Route getRoute() {
		return this.route;
	}
	
	@NotNull
	@Min(0)
	public Integer getArrivalOrder() {
		return arrivalOrder;
	}

	@NotNull
	@Min(1)
	public Integer getArrivalTime() {
		return arrivalTime;
	}

	
	public Double getDistance() {
		return distance;
	}

	//Setters

	public void setLocation(final String text) {
		this.location = text;
	}

	public void setRoute(final Route route) {
		this.route = route;
	}
	
	public void setDistance(Double distance) {
		this.distance = distance;
	}
	
	public void setArrivalTime(Integer arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public void setArrivalOrder(Integer arrivalOrder) {
		this.arrivalOrder = arrivalOrder;
	}
	
	public int compareTo(ControlPoint n){
		
		return Integer.compare(this.arrivalOrder, n.arrivalOrder);
	}
}
