
package controllers.driver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import services.ActorService;
import services.RouteService;
import controllers.AbstractController;

@Controller
@RequestMapping("/route2/driver")
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
	/*
	 * // Listing active routes by driver-------------------------------------
	 * 
	 * @RequestMapping(value = "/listActive", method = RequestMethod.GET)
	 * public ModelAndView listActiveRoutesByDriver() {
	 * ModelAndView result;
	 * Collection<Route> routes;
	 * Driver driver;
	 * UserAccount ua;
	 * 
	 * ua = LoginService.getPrincipal();
	 * driver = (Driver) this.actorService.findByUserAccount(ua);
	 * Assert.notNull(driver);
	 * 
	 * routes = this.routeService.findActiveRoutesByDriver(driver.getId(), new Date());
	 * 
	 * result = new ModelAndView("route/list");
	 * result.addObject("routes", routes);
	 * result.addObject("driver", driver);
	 * result.addObject("requestURI", "route/driver/listActive.do");
	 * 
	 * return result;
	 * 
	 * }
	 * 
	 * // Creation ---------------------------------------------------------------
	 * 
	 * @RequestMapping(value = "/create", method = RequestMethod.GET)
	 * public ModelAndView create() {
	 * ModelAndView result;
	 * Route route;
	 * 
	 * route = this.routeService.create();
	 * 
	 * result = this.createEditModelAndView(route);
	 * 
	 * return result;
	 * }
	 * 
	 * @RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	 * public ModelAndView save(@Valid final Route route, final BindingResult binding) {
	 * 
	 * if (route.getId() != 0)
	 * Assert.isTrue(route.getDriver().getId() == this.actorService.findByPrincipal().getId());
	 * 
	 * ModelAndView result;
	 * for (final ObjectError oe : binding.getAllErrors())
	 * System.out.println(oe);
	 * if (binding.hasErrors()) {
	 * System.out.println(binding.getAllErrors());
	 * result = this.createEditModelAndView(route);
	 * } else
	 * try {
	 * this.routeService.save(route);
	 * result = new ModelAndView("redirect:/route/list.do");
	 * } catch (final Throwable oops) {
	 * oops.printStackTrace();
	 * result = this.createEditModelAndView(route, "driver.commit.error");
	 * }
	 * return result;
	 * }
	 * 
	 * // Ancilliary methods ----------------------------------------------------------------
	 * private ModelAndView createEditModelAndView(final Route route) {
	 * ModelAndView result;
	 * 
	 * result = this.createEditModelAndView(route, null);
	 * 
	 * return result;
	 * }
	 * 
	 * private ModelAndView createEditModelAndView(final Route route, final String message) {
	 * ModelAndView result;
	 * String requestURI;
	 * 
	 * final Driver driver = (Driver) this.actorService.findByPrincipal();
	 * 
	 * requestURI = "route/driver/edit.do";
	 * result = new ModelAndView("route/driver/create");
	 * result.addObject("route", route);
	 * result.addObject("vehicles", driver.getVehicles());
	 * result.addObject("message", message);
	 * result.addObject("requestURI", requestURI);
	 * 
	 * return result;
	 * }
	 */
}
