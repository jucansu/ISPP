package forms;

public class ControlPointFormCreate {

	public ControlPointFormCreate() {
		super();
	}
	
	private String	location;
	private Integer	arrivalOrder;
	private Integer estimatedTime;
	private Double	distance;
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public Integer getArrivalOrder() {
		return arrivalOrder;
	}
	
	public void setArrivalOrder(Integer arrivalOrder) {
		this.arrivalOrder = arrivalOrder;
	}
	
	public Integer getEstimatedTime() {
		return estimatedTime;
	}
	
	public void setEstimatedTime(Integer estimatedTime) {
		this.estimatedTime = estimatedTime;
	}
	
	public Double getDistance() {
		return distance;
	}
	
	public void setDistance(Double distance) {
		this.distance = distance;
	}

}
