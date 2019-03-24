
package controllers;

import java.util.Collection;

import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.RouteService;
import domain.LuggageSize;
import domain.Route;
import domain.VehicleType;
import forms.FinderForm;

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

	@RequestMapping(value = "/display", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@RequestParam final int routeID) {

		ModelAndView result;
		Route route;

		route = this.routeService.findOne(routeID);
		Assert.notNull(route);
		result = new ModelAndView("route/display");

		result.addObject("route", route);

		return result;
	}

	//Route Searching
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView searchView() {
		final ModelAndView result;
		FinderForm finderForm;

		finderForm = new FinderForm();
		result = new ModelAndView("route/search");
		result.addObject("finderForm", finderForm);

		return result;
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST, params = "search")
	public ModelAndView search(@RequestParam final LocalDateTime departureDate, final String origin, final String destination, final VehicleType vehicleType, final Integer aviableSeats, final LuggageSize luggageSize, final Boolean pets,
		final Boolean childs, final Boolean smoke, final Boolean music) {
		ModelAndView result;
		Collection<Route> routes;

		routes = this.routeService.finderSearch(departureDate, origin, destination, vehicleType, aviableSeats, luggageSize, pets, childs, smoke, music);
		result = new ModelAndView("route/listAll");
		result.addObject("routes", routes);
		result.addObject("requestURI", "artist/route.do");

		return result;
	}

}
