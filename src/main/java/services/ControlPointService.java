
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ControlPointRepository;
import domain.ControlPoint;
import domain.Driver;
import domain.Route;

@Service
@Transactional
public class ControlPointService {

	//Managed service

	@Autowired
	private ControlPointRepository	controlPointRepository;

	//Supporting service

	@Autowired
	private ActorService			actorService;

	@Autowired
	private RouteService			routeService;


	//Simple CRUD methods

	public ControlPoint create(final int routeId) {

		final ControlPoint c = new ControlPoint();
		
		final Route route = this.routeService.findOne(routeId);
		c.setRoute(route);
		
		Driver driver = (Driver) this.actorService.findByPrincipal();
		Assert.isTrue(route.getDriver().getId() == driver.getId());
		
		if(route.getControlPoints().isEmpty()){
			c.setArrivalOrder(0);
		} else{
			c.setArrivalOrder(route.getControlPoints().size());
		}

		return c;
	}

	public Collection<ControlPoint> findAll() {
		return this.controlPointRepository.findAll();
	}

	public ControlPoint findOne(final int id) {
		Assert.notNull(id);

		return this.controlPointRepository.findOne(id);
	}

	public ControlPoint save(final ControlPoint controlPoint) {
		Assert.notNull(controlPoint);

		//Assertion that the user deleting this note has the correct privilege.
		Assert.isTrue(this.actorService.findByPrincipal().getId() == controlPoint.getRoute().getDriver().getId());
		Route route = controlPoint.getRoute();
		Collection<ControlPoint> controls = route.getControlPoints();
		
		List<ControlPoint> cps = new ArrayList<ControlPoint>(controls);
		cps.add(controlPoint);
		Collections.sort(cps);
		
		if(cps.size() <= 1 || cps.indexOf(controlPoint) != 0){
			controlPoint.setDistance(0.0);
		} else {
			controlPoint.setDistance(routeService.getDistance(cps.get(cps.indexOf(controlPoint)-1).getLocation(), controlPoint.getLocation()));
		}
		
		final ControlPoint saved = this.controlPointRepository.save(controlPoint);
		controls.add(saved);
		
		this.routeService.save(route);
		
		

		return saved;
	}

	public void delete(final ControlPoint controlPoint) {
		Assert.notNull(controlPoint);

		//Assertion that the user deleting this note has the correct privilege.
		Assert.isTrue(this.actorService.findByPrincipal().getId() == controlPoint.getRoute().getDriver().getId());

		this.controlPointRepository.delete(controlPoint);
		
		Route route = controlPoint.getRoute();
		Collection<ControlPoint> controls = route.getControlPoints();
		controls.remove(controlPoint);
		
		if(route.getControlPoints().size()>=2){
		List<ControlPoint> cps = new ArrayList<ControlPoint>(controls);
		Collections.sort(cps);
		int order = 0;
		for(ControlPoint a : cps){
			a.setArrivalOrder(order);
			order++;
			this.controlPointRepository.save(a);
			}
		}
		
		this.routeService.save(route);

	}
	
	
	public Double getDistanceTwoPoints(ControlPoint start, ControlPoint end , Route c){
		Assert.isTrue(c.getControlPoints().contains(start) && c.getControlPoints().contains(end));
		List<ControlPoint> cps = new ArrayList<ControlPoint>(c.getControlPoints());
		Collections.sort(cps);
		Double distance = 0.0;
		int ok = 0;
		for(ControlPoint a : cps){
			if(a.equals(start)|| a.equals(end)){
				if(ok >= 1){
					distance = distance + a.getDistance();
				}
				ok++;
				if(ok < 2){
					break;
				}
			}
		}
		return distance;
		
	}

}
