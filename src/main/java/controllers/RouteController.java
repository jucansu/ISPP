
package controllers;

import java.util.Collection;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import security.LoginService;
import security.UserAccount;
import services.ActorService;
import services.RouteService;
import domain.Driver;
import domain.Finder;
import domain.Passenger;
import domain.Route;

@Controller
@RequestMapping("/route")
public class RouteController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private ActorService	actorService;
	@Autowired
	private RouteService	routeService;


	// Constructors -----------------------------------------------------------
	public RouteController() {
		super();
	}

	// Listing -------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Route> routes;

		routes = this.routeService.findAll();

		result = new ModelAndView("route/list");
		result.addObject("routes", routes);
		result.addObject("requestURI", "route/list.do");

		return result;

	}

	@RequestMapping(value = "/driver/listActive", method = RequestMethod.GET)
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

	@RequestMapping(value = "/passenger/listActive", method = RequestMethod.GET)
	public ModelAndView listActiveRoutesByPassenger() {
		ModelAndView result;
		Collection<Route> routes;
		Passenger passenger;
		UserAccount ua;

		ua = LoginService.getPrincipal();
		passenger = (Passenger) this.actorService.findByUserAccount(ua);
		Assert.notNull(passenger);

		routes = this.routeService.findActiveRoutesByPassenger(passenger.getId());

		result = new ModelAndView("route/list");
		result.addObject("routes", routes);
		result.addObject("passenger", passenger);
		result.addObject("requestURI", "route/passenger/listActive.do");

		return result;
	}

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int routeID) {

		ModelAndView result;
		Route route;

		route = this.routeService.findOne(routeID);
		Assert.notNull(route);
		result = new ModelAndView("route/display");

		result.addObject("route", route);

		return result;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView searchView() {
		final ModelAndView result;
		Finder finder;

		finder = new Finder();
		result = new ModelAndView("route/search");
		result.addObject("finder", finder);

		return result;
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView searchResult(@Valid final Finder finder, final BindingResult bindingResult) {
		ModelAndView result;
		Collection<Route> routes;

		try {
			routes = this.routeService.searchRoutes(finder);
			result = new ModelAndView("route/searchResults");
			result.addObject("routes", routes);

		} catch (final Throwable oops) {
			oops.printStackTrace();
			result = this.searchView();
			result.addObject(finder);
		}

		return result;
	}

	// Creation ---------------------------------------------------------------
	@RequestMapping(value = "/driver/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Route route;

		route = this.routeService.create();

		result = this.createEditModelAndView(route);

		return result;
	}

	@RequestMapping(value = "/driver/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Route route, final BindingResult binding) {

		if (route.getId() != 0)
			Assert.isTrue(route.getDriver().getId() == this.actorService.findByPrincipal().getId());

		ModelAndView result;
		for (final ObjectError oe : binding.getAllErrors())
			System.out.println(oe);
		if (binding.hasErrors()) {
			System.out.println(binding.getAllErrors());
			result = this.createEditModelAndView(route);
		} else
			try {
				this.routeService.save(route);
				result = new ModelAndView("redirect:/route/list.do");
			} catch (final Throwable oops) {
				oops.printStackTrace();
				result = this.createEditModelAndView(route, "driver.commit.error");
			}
		return result;
	}

	// Ancilliary methods ----------------------------------------------------------------
	private ModelAndView createEditModelAndView(final Route route) {
		ModelAndView result;

		result = this.createEditModelAndView(route, null);

		return result;
	}

	private ModelAndView createEditModelAndView(final Route route, final String message) {
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
