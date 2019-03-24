
package domain;

public enum ReservationStatus {

	PENDING("PENDING", 1), ACCEPTED("ACCEPTED", 2), CANCELLED("CANCELLED", 3);

	private int		id;
	private String	name;


	private ReservationStatus(final String name, final int id) {
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
