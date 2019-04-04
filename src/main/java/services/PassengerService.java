
package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.PassengerRepository;
import security.Authority;
import security.UserAccount;
import security.UserAccountService;
import domain.Passenger;

@Service
@Transactional
public class PassengerService {

	//managed repository
	@Autowired
	private PassengerRepository	passengerRepository;

	//Supporting Services
	@Autowired
	private ActorService		actorService;
	@Autowired
	private UserAccountService	userAccountService;


	//CRUD

	public Passenger create() {
		final Passenger result;
		UserAccount ua;
		Authority authority;
		Collection<Authority> authorities;

		ua = this.userAccountService.create();
		ua.setUsername("");
		ua.setPassword("");
		ua.setEnabled(true);
		authority = new Authority();
		authority.setAuthority(Authority.ADMIN);
		authorities = new ArrayList<Authority>();
		authorities.add(authority);
		ua.setAuthorities(authorities);

		result = new Passenger();
		result.setUserAccount(ua);

		return result;
	}

	public Passenger findOne(final int adminId) {
		Passenger result;

		result = this.passengerRepository.findOne(adminId);

		return result;
	}

	public Collection<Passenger> findAll() {
		Collection<Passenger> result;

		result = this.passengerRepository.findAll();

		return result;
	}

	public Passenger save(final Passenger passenger) {
		Assert.notNull(passenger);

		Passenger result;

		result = (Passenger) this.actorService.save(passenger);

		return result;
	}

	public Collection<Passenger> findPassengersAcceptedByRoute(int routeId) {
		Collection<Passenger> result;

		result = this.passengerRepository.findPassengersAcceptedByRoute(routeId);

		return result;
	}

}
