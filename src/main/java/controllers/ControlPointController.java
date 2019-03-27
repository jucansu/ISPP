
package controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.ControlPointService;
import services.RouteService;
import forms.ControlPointFormCreate;
import forms.RouteForm;

@Controller
@RequestMapping("/controlpoint")
public class ControlPointController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private ActorService	actorService;
	@Autowired
	private RouteService	routeService;
	@Autowired
	private RouteController routeController;
	@Autowired
	private ControlPointService cpService;


	// Constructors -----------------------------------------------------------
	public ControlPointController() {
		super();
	}
	
	@RequestMapping(value="/driver/add", method=RequestMethod.POST)
	public ModelAndView add(@ModelAttribute(value="route") RouteForm routeForm, BindingResult binding) {
		ModelAndView result;
		
		if (routeForm.getControlpoints() == null) {
			routeForm.setControlpoints(new ArrayList<ControlPointFormCreate>());
		}
		
		ControlPointFormCreate cp = cpService.constructCreate(cpService.create());
		cp.setArrivalOrder(routeForm.getControlpoints().size()+1);
		routeForm.getControlpoints().add(cp);
		routeForm.getDestination().setArrivalOrder(routeForm.getControlpoints().size()+1);
		
		result = routeController.createEditModelAndView(routeForm, null);
		
		return result;
	}
	
	@RequestMapping(value="/driver/remove", method=RequestMethod.POST)
	public ModelAndView remove(@ModelAttribute(value="route") RouteForm routeForm, BindingResult binding,
		@RequestParam Integer index) {
		ModelAndView result;
		System.out.println("es index null?? "+index);
		System.out.println("es cp null?? "+Boolean.toString(routeForm.getControlpoints() == null));
		if (routeForm.getControlpoints() != null) {
			System.out.println("size: "+routeForm.getControlpoints().size());
		}
		if (index != null && index > -1 && routeForm.getControlpoints() != null &&
			routeForm.getControlpoints().size()-1 >= index) {
			ControlPointFormCreate  cp;
			for (int i = index; i < routeForm.getControlpoints().size() - 1; i++) {
				System.out.println("index: "+i);
				cp = routeForm.getControlpoints().get(i);
				System.out.println("index: "+i+" cp null?? "+Boolean.toString(cp == null));
				cp.setArrivalOrder(cp.getArrivalOrder() - 1);
			}
			routeForm.getControlpoints().remove((int)index);
			System.out.println("destination null?? "+Boolean.toString(routeForm.getDestination() == null));
			routeForm.getDestination().setArrivalOrder(routeForm.getDestination().getArrivalOrder() - 1);
		}
		
		result = routeController.createEditModelAndView(routeForm, null);
		
		return result;
	}

	/*
	 * // Listing -------------------------------------
	 * 
	 * @RequestMapping(value = "/list", method = RequestMethod.GET)
	 * public ModelAndView list() {
	 * ModelAndView result;
	 * Collection<Route> routes;
	 * 
	 * routes = this.routeService.findAll();
	 * 
	 * result = new ModelAndView("route/list");
	 * result.addObject("routes", routes);
	 * result.addObject("requestURI", "route/list.do");
	 * 
	 * return result;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/display", method = RequestMethod.POST, params = "save")
	 * public ModelAndView save(@RequestParam final int routeID) {
	 * 
	 * ModelAndView result;
	 * Route route;
	 * 
	 * route = this.routeService.findOne(routeID);
	 * Assert.notNull(route);
	 * result = new ModelAndView("route/display");
	 * 
	 * result.addObject("route", route);
	 * 
	 * return result;
	 * }
	 * 
	 * @RequestMapping(value = "/search", method = RequestMethod.GET)
	 * public ModelAndView searchView() {
	 * final ModelAndView result;
	 * Finder finder;
	 * 
	 * finder = new Finder();
	 * result = new ModelAndView("route/search");
	 * result.addObject("finder", finder);
	 * 
	 * return result;
	 * }
	 * 
	 * @RequestMapping(value = "/search", method = RequestMethod.POST)
	 * public ModelAndView searchResult(@Valid Finder finder, BindingResult bindingResult) {
	 * ModelAndView result;
	 * Collection<Route> routes;
	 * 
	 * // routes = this.routeService.searchRoutes(finder);
	 * routes = this.routeService.findAll();
	 * 
	 * result = new ModelAndView("route/searchResults");
	 * result.addObject("routes", routes);
	 * 
	 * return result;
	 * }
	 */
}
