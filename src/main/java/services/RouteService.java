
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.RouteRepository;
import domain.Driver;
import domain.Reservation;
import domain.Route;

@Service
@Transactional
public class RouteService {

	//Managed repository

	@Autowired
	private RouteRepository	routeRepository;

	//Supporting services

	@Autowired
	private ActorService	actorService;


	//Simple CRUD methods

	public Route create() {
		final Route r = new Route();

		final Driver d = (Driver) this.actorService.findByPrincipal();
		r.setDriver(d);
		r.setReservations(new ArrayList<Reservation>());

		return r;
	}

	public Route findOne(final int id) {
		Assert.notNull(id);

		return this.routeRepository.findOne(id);
	}

	public Collection<Route> findAll() {
		return this.routeRepository.findAll();
	}

	public Route save(final Route r) {
		Assert.notNull(r);

		//Assertion that the user modifying this task has the correct privilege.
		Assert.isTrue(this.actorService.findByPrincipal().getId() == r.getDriver().getId());

		final Route saved = this.routeRepository.save(r);

		return saved;
	}
	public void delete(final Route r) {
		Assert.notNull(r);

		//Assertion that the user deleting this task has the correct privilege.
		Assert.isTrue(this.actorService.findByPrincipal().getId() == r.getDriver().getId());

		this.routeRepository.delete(r);
	}

	//	public void delete2(final Route route) {
	//		Assert.notNull(route);
	//
	//		//Assertion that the user deleting this note has the correct privilege.
	//
	//		Assert.isTrue(this.actorService.findByPrincipal().getId() == route.getDriver().getId());
	//		//Also, we delete the reservations related with the deleted route
	//		if (!(route.getReservations().isEmpty()))
	//			for (final Reservation r : route.getReservations())
	//				this.reservationService.delete(r);
	//
	//		this.routeRepository.delete(route);
	//	}

}
