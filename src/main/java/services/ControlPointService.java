
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ControlPointRepository;
import domain.ControlPoint;
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

		final ControlPoint saved = this.controlPointRepository.save(controlPoint);
		
		Route route = controlPoint.getRoute();
		Collection<ControlPoint> controls = route.getControlPoints();
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
		
		this.routeService.save(route);

	}

}
