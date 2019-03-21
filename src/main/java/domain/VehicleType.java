
package domain;

public enum VehicleType {

	CAR("CAR", 1), BIKE("BIKE", 2);

	private int		id;
	private String	name;


	private VehicleType(final String name, final int id) {
		this.name = name;
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(final String name) {
		this.name = name;
	}

	public int getId() {
		return this.id;

	}
}
