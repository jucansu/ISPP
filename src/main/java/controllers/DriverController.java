
package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import security.UserAccount;
import services.ActorService;
import services.DriverService;
import domain.Driver;
import forms.CredentialsfForm;

@Controller
@RequestMapping("/driver")
public class DriverController extends AbstractController {

	// Services ---------------------------------
	@Autowired
	private DriverService	driverService;

	@Autowired
	private ActorService	actorService;


	// Constructor ------------------------------
	public DriverController() {
		super();
	}

	// Displaying -------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int driverId) {
		Assert.notNull(driverId);

		ModelAndView result;
		Driver driver;

		driver = this.driverService.findOne(driverId);
		result = new ModelAndView("driver/display");
		result.addObject("driver", driver);

		return result;
	}

	// Creation -----------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Driver driver;

		driver = this.driverService.create();

		result = this.createEditModelAndView(driver, "driver/create");

		return result;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save2(@Valid final Driver driver, final BindingResult binding) {
		ModelAndView result;
		UserAccount userAccount;
		if (binding.hasErrors()) {
			System.out.println(binding.getAllErrors().toString());
			result = this.createEditModelAndView(driver, "driver/create");
		} else
			try {
				userAccount = super.hashSavePassword(driver.getUserAccount());
				driver.setUserAccount(userAccount);
				this.driverService.save(driver);
				result = new ModelAndView("redirect:/security/login.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(driver, "driver.commit.error");
			}
		return result;
	}
	// Edition -----------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int driverId) {
		ModelAndView result;
		Driver driver;
		Driver principal;
		String requestURI;

		requestURI = "driver/edit.do";
		driver = this.driverService.findOne(driverId);
		principal = (Driver) this.actorService.findByPrincipal();

		Assert.isTrue(driver.getId() == principal.getId());

		result = this.createEditModelAndView(driver, "driver/edit");
		result.addObject("requestURI", requestURI);
		return result;
	}
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(final Driver driver, final BindingResult binding) {
		ModelAndView result;

		Driver driverReconstruct;

		driverReconstruct = this.driverService.reconstruct(driver, binding);

		if (binding.hasErrors()) {
			System.out.println(binding.getAllErrors());
			result = this.createEditModelAndView(driver, "driver/edit");
		} else
			try {
				this.driverService.save(driverReconstruct);
				result = new ModelAndView("redirect:/driver/display.do?driverId=" + driverReconstruct.getId());
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(driver, "driver.commit.error");
			}
		return result;
	}
	
	// Edition Credentials-----------------------------------------------------------
	@RequestMapping(value = "/editCredentials", method = RequestMethod.GET)
	public ModelAndView editCredentials(){
		ModelAndView res = null;
		
		Driver driver = (Driver) this.actorService.findByPrincipal();
		CredentialsfForm credentialsfForm = driverService.constructCredential(driver);
		
		res = this.createEditModelAndViewEditCredentials(credentialsfForm);
		res.addObject("credentialsfForm", credentialsfForm);
		
		return res;
	}
	
	@RequestMapping(value = "/editCredentials", method = RequestMethod.POST, params = "save")
	public ModelAndView editCredentials(@Valid final CredentialsfForm credentialsfForm, final BindingResult binding) {
		ModelAndView res;
		Driver driver;

		if (binding.hasErrors())
			res = this.createEditModelAndViewEditCredentials(credentialsfForm, "driver.params.error");
		else if (!credentialsfForm.getRepeatPassword().equals(credentialsfForm.getPassword()))
			res = this.createEditModelAndViewEditCredentials(credentialsfForm, "driver.commit.errorPassword");
		else
			try {
				driver = driverService.reconstructCredential(credentialsfForm, binding);
				this.driverService.saveCredentials(driver);
				res = new ModelAndView("redirect:/j_spring_security_logout");
			} catch (final Throwable oops) {
				res = this.createEditModelAndViewEditCredentials(credentialsfForm, "driver.commit.error");
			}

		return res;
	}

	// Ancilliary methods -----------------------------------------------------------
	private ModelAndView createEditModelAndView(final Driver driver, final String model) {
		ModelAndView result;

		result = this.createEditModelAndView(driver, model, null);

		return result;

	}

	private ModelAndView createEditModelAndView(final Driver driver, final String model, final String message) {
		ModelAndView result;

		result = new ModelAndView(model);
		result.addObject("driver", driver);
		result.addObject("message", message);

		return result;
	}
	
	protected ModelAndView createEditModelAndViewEditCredentials(final CredentialsfForm credentialsfForm) {
		ModelAndView result;

		result = this.createEditModelAndViewEditCredentials(credentialsfForm, null);

		return result;
	}

	protected ModelAndView createEditModelAndViewEditCredentials(final CredentialsfForm credentialsfForm,
			final String message) {
		ModelAndView result;

		result = new ModelAndView("driver/editCredentials");
		result.addObject("credentialsfForm", credentialsfForm);
		result.addObject("message", message);
		result.addObject("requestURI","driver/editCredentials.do");

		return result;
	}

}
