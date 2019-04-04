
package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.DriverRepository;
import security.Authority;
import security.UserAccount;
import security.UserAccountService;
import domain.Driver;

@Service
@Transactional
public class DriverService {

	//managed repository
	@Autowired
	private DriverRepository	driverRepository;

	//Supporting Services
	@Autowired
	private ActorService		actorService;
	@Autowired
	private UserAccountService	userAccountService;


	//CRUD

	public Driver create() {
		final Driver result;
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

		result = new Driver();
		result.setUserAccount(ua);

		return result;
	}

	public Driver findOne(final int adminId) {
		Driver result;

		result = this.driverRepository.findOne(adminId);

		return result;
	}

	public Collection<Driver> findAll() {
		Collection<Driver> result;

		result = this.driverRepository.findAll();

		return result;
	}

	public Driver save(final Driver driver) {
		Assert.notNull(driver);

		Driver result;

		result = (Driver) this.actorService.save(driver);

		return result;
	}

}
