
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.DriverService;
import domain.Driver;
import domain.Vehicle;

@Controller
@RequestMapping("/vehicle")
public class VehicleController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private DriverService	driverService;


	// Constructors -----------------------------------------------------------
	public VehicleController() {
		super();
	}

	// Listing -------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam final int driverId) {
		ModelAndView result;
		final Driver driver;
		final Collection<Vehicle> vehicles;

		driver = this.driverService.findOne(driverId);
		vehicles = driver.getVehicles();

		result = new ModelAndView("route/list");
		result.addObject("vehicles", vehicles);
		result.addObject("requestURI", "route/list.do?driverId=" + driver.getId());

		return result;

	}

}
