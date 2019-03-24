
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;

@Entity
@Access(AccessType.PROPERTY)
public class Vehicle extends DomainEntity {

	//Attributes
	
	private String model;
	
	private String vehicleBrand;
	
	private String image;
	
	private int  seatsCapacity;
	
	private VehicleType type;
	
	private String plate;
	
	private String description;

	//Relationships

	private Driver	driver;
	
	private Collection<Route> routes;


	//Getters

	public String getDescription() {
		return description;
	}
	
	@NotBlank
	@Pattern(regexp= "([A-Z]{1,2})?/d{4}([A-Z]{2,3})", message  = "Invalid Plate")
	public String getPlate() {
		return plate;
	}

	@NotNull
	public VehicleType getType() {
		return type;
	}
	
	@Min(value = 2)
	public int getSeatsCapacity() {
		return seatsCapacity;
	}
	
	@URL
	public String getImage() {
		return image;
	}

	@NotBlank
	public String getVehicleBrand() {
		return vehicleBrand;
	}
	
	@NotBlank
	public String getModel() {
		return model;
	}
	
	@Valid
	@NotNull
	@OneToMany(mappedBy = "vehicle")
	public Collection<Route> getRoutes() {
		return this.routes;
	}
	
	@Valid
	@NotNull
	@ManyToOne(optional = false)
	public Driver getDriver() {
		return this.driver;
	}

	//Setters

	public void setModel(String model) {
		this.model = model;
	}



	public void setVehicleBrand(String vehicleBrand) {
		this.vehicleBrand = vehicleBrand;
	}



	public void setImage(String image) {
		this.image = image;
	}

	public void setSeatsCapacity(int seatsCapacity) {
		this.seatsCapacity = seatsCapacity;
	}



	public void setType(VehicleType type) {
		this.type = type;
	}


	public void setPlate(String plate) {
		this.plate = plate;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	public void setDriver(final Driver driver) {
		this.driver = driver;
	}
	
	public void setRoutes(final Collection<Route> routes) {
		this.routes = routes;
	}
}
