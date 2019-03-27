
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
import domain.Finder;
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

}
