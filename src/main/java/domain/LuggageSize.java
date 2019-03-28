
package domain;

public enum LuggageSize {

	SMALL("SMALL", 1), MEDIUM("MEDIUM", 2), BIG("BIG", 3), NOTHING("NOTHING", 4);

	private int		id;
	private String	name;


	private LuggageSize(final String name, final int id) {
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
