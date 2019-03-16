
package security;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
@Transactional
public class UserAccountService {

	// Managed repository -----------------------------------------------------

	@Autowired
	private UserAccountRepository	userAccountRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------

	public UserAccountService() {
		super();

	}

	// Simple CRUD methods ----------------------------------------------------
	public UserAccount create() {
		UserAccount result;

		result = new UserAccount();

		return result;
	}

	public UserAccount findOne(final int userAccountId) {
		Assert.isTrue(userAccountId != 0);

		UserAccount result;

		result = this.userAccountRepository.findOne(userAccountId);

		return result;

	}
	public UserAccount save(final UserAccount userAccount) {
		Assert.notNull(userAccount);

		UserAccount result;

		result = this.userAccountRepository.save(userAccount);

		return result;
	}

	// Other business methods -------------------------------------------------

	public UserAccount findByUsername(final String username) {
		Assert.notNull(username);
		Assert.hasText(username);

		UserAccount result;

		result = this.userAccountRepository.findByUsername(username);

		return result;
	}

}
