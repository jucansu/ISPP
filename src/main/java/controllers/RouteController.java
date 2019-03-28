
package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.RouteService;
import domain.Driver;
import domain.Finder;
import domain.Route;

@Controller
@RequestMapping("/route")
public class RouteController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private RouteService	routeService;

	@Autowired
	private ActorService	actorService;


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

	// Creation ---------------------------------------------------------------

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

		//		routes = this.routeService.searchRoutes(finder);
		routes = this.routeService.findAll();

		result = new ModelAndView("route/searchResults");
		result.addObject("routes", routes);

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

	private ModelAndView routeDisplayModelAndView(final Route route, final String message) {
		ModelAndView result;
		String requestURI;

		requestURI = "route/display.do";
		result = new ModelAndView("route/display");
		result.addObject("route", route);
		result.addObject("message", message);
		result.addObject("requestURI", requestURI);

		return result;
	}

}
