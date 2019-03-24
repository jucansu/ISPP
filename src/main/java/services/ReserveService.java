
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ReserveRepository;
import domain.Passenger;
import domain.Reserve;

@Service
@Transactional
public class ReserveService {

	//Managed repository

	@Autowired
	private ReserveRepository	reserveRepository;

	//Supporting services

	@Autowired
	private ActorService		actorService;


	//Simple CRUD methods

	public Reserve create() {
		final Reserve r = new Reserve();

		final Passenger p = (Passenger) this.actorService.findByPrincipal();
		r.setPassenger(p);

		return r;
	}

	public Reserve findOne(final int id) {
		Assert.notNull(id);

		return this.reserveRepository.findOne(id);
	}

	public Collection<Reserve> findAll() {
		return this.reserveRepository.findAll();
	}

	public Reserve save(final Reserve r) {
		Assert.notNull(r);

		//Assertion that the user modifying this task has the correct privilege.
		Assert.isTrue(this.actorService.findByPrincipal().getId() == r.getPassenger().getId());

		final Reserve saved = this.reserveRepository.save(r);

		return saved;
	}
	public void delete(final Reserve r) {
		Assert.notNull(r);

		//Assertion that the user deleting this task has the correct privilege.
		Assert.isTrue(this.actorService.findByPrincipal().getId() == r.getPassenger().getId());

		this.reserveRepository.delete(r);
	}

}
