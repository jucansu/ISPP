
package controllers.driver;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import security.LoginService;
import security.UserAccount;
import services.ActorService;
import services.RouteService;
import controllers.AbstractController;
import domain.Driver;
import domain.Route;
import forms.RouteForm;

@Controller
@RequestMapping("/route/driver")
public class RouteDriverController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private ActorService	actorService;
	@Autowired
	private RouteService	routeService;


	// Constructors -----------------------------------------------------------
	public RouteDriverController() {
		super();
	}
	
	// Listing active routes by driver-------------------------------------
	@RequestMapping(value = "/listActive", method = RequestMethod.GET)
	public ModelAndView listActiveRoutesByDriver() {
		ModelAndView result;
		Collection<Route> routes;
		Driver driver;
		UserAccount ua;

		ua = LoginService.getPrincipal();
		driver = (Driver) this.actorService.findByUserAccount(ua);
		Assert.notNull(driver);

		routes = this.routeService.findActiveRoutesByDriver(driver.getId(), new Date());

		result = new ModelAndView("route/list");
		result.addObject("routes", routes);
		result.addObject("driver", driver);
		result.addObject("requestURI", "route/driver/listActive.do");

		return result;
	}
	
	// Creation ---------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		RouteForm routeForm;

		routeForm = routeService.construct(routeService.create());

		result = this.createEditModelAndView(routeForm);

		return result;
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@ModelAttribute(value="route") final RouteForm routeForm, final BindingResult binding) {
		ModelAndView result;
		
		Driver driver = (Driver) actorService.findByPrincipal();
		
//		for (final ObjectError oe : binding.getAllErrors())
//			System.out.println(oe);
		if (binding.hasErrors()) {
			System.out.println(binding.getAllErrors());
			result = this.createEditModelAndView(routeForm);
		}
		else {
			try {
				Route route = routeService.reconstruct(routeForm, driver);
				route = routeService.save(route);
				result = new ModelAndView("redirect:/route/display.do?routeID="+route.getId());
			}
			catch (final Throwable oops) {
				oops.printStackTrace();
				result = this.createEditModelAndView(routeForm, "driver.commit.error");
			}
		}
		return result;
	}
	
	// Ancilliary methods ----------------------------------------------------------------
	private ModelAndView createEditModelAndView(final RouteForm route) {
		ModelAndView result;

		result = this.createEditModelAndView(route, null);

		return result;
	}

	public ModelAndView createEditModelAndView(final RouteForm route, final String message) {
		ModelAndView result;
		String requestURI;

		final Driver driver = (Driver) this.actorService.findByPrincipal();

		requestURI = "route/driver/edit.do";
		result = new ModelAndView("route/driver/create");
		result.addObject("route", route);
		result.addObject("vehicles", driver.getVehicles());
		result.addObject("message", message);
		result.addObject("requestURI", requestURI);

		return result;
	}

}
