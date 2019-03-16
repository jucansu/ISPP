
package domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Car implements Serializable {

	private static final long	serialVersionUID	= 1L;

	@Id
	private int					id;
	private String				model;
	private String				name;
	private int					price;


	public int getId() {
		return this.id;
	}

	public void setId(final int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(final String name) {
		this.name = name;
	}

	public int getPrice() {
		return this.price;
	}

	public void setPrice(final int price) {
		this.price = price;
	}
	public String getModel() {
		return this.model;
	}
	public void setModel(final String model) {
		this.model = model;
	}
}
