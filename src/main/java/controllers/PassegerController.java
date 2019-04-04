
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
import services.PassengerService;
import domain.Passenger;

@Controller
@RequestMapping("/passenger")
public class PassegerController extends AbstractController {

	// Services ---------------------------------
	@Autowired
	private PassengerService	passengerService;

	@Autowired
	private ActorService		actorService;


	// Constructor ------------------------------
	public PassegerController() {
		super();
	}

	// Displaying -------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int passengerId) {
		Assert.notNull(passengerId);

		ModelAndView result;
		Passenger passenger;

		passenger = this.passengerService.findOne(passengerId);
		result = new ModelAndView("passenger/display");
		result.addObject("passenger", passenger);

		return result;
	}

	// Creation -----------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Passenger passenger;

		passenger = this.passengerService.create();

		result = this.createEditModelAndView(passenger, "passenger/create");

		return result;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save2(@Valid final Passenger passenger, final BindingResult binding) {
		ModelAndView result;
		UserAccount userAccount;
		if (binding.hasErrors()) {
			System.out.println(binding.getAllErrors().toString());
			result = this.createEditModelAndView(passenger, "passenger/create");
		} else
			try {
				userAccount = super.hashSavePassword(passenger.getUserAccount());
				passenger.setUserAccount(userAccount);
				this.passengerService.save(passenger);
				result = new ModelAndView("redirect:/security/login.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(passenger, "passenger.commit.error");
			}
		return result;
	}
	// Edition -----------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int passengerId) {
		ModelAndView result;
		Passenger passenger;
		Passenger principal;
		String requestURI;

		requestURI = "passenger/edit.do";
		passenger = this.passengerService.findOne(passengerId);
		principal = (Passenger) this.actorService.findByPrincipal();

		Assert.isTrue(passenger.getId() == principal.getId());

		result = this.createEditModelAndView(passenger, "passenger/edit");
		result.addObject("requestURI", requestURI);
		return result;
	}
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(final Passenger passenger, final BindingResult binding) {
		ModelAndView result;

		Passenger passengerReconstruct;

		passengerReconstruct = this.passengerService.reconstruct(passenger, binding);

		if (binding.hasErrors()) {
			System.out.println(binding.getAllErrors());
			result = this.createEditModelAndView(passenger, "passenger/edit");
		} else
			try {
				this.passengerService.save(passengerReconstruct);
				result = new ModelAndView("redirect:/passenger/display.do?passengerId=" + passengerReconstruct.getId());
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(passenger, "passenger.commit.error");
			}
		return result;
	}

	// Ancilliary methods -----------------------------------------------------------
	private ModelAndView createEditModelAndView(final Passenger passenger, final String model) {
		ModelAndView result;

		result = this.createEditModelAndView(passenger, model, null);

		return result;

	}

	private ModelAndView createEditModelAndView(final Passenger passenger, final String model, final String message) {
		ModelAndView result;

		result = new ModelAndView(model);
		result.addObject("passenger", passenger);
		result.addObject("message", message);

		return result;
	}

}
