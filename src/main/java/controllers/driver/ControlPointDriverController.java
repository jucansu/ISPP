
package controllers.driver;

import javax.validation.Valid;

import org.springframework.util.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.ControlPointService;
import controllers.AbstractController;
import domain.ControlPoint;

@Controller
@RequestMapping("/controlpoint/driver")
public class ControlPointDriverController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private ActorService	actorService;

	@Autowired
	private ControlPointService controlPointService;


	// Constructors -----------------------------------------------------------
	public ControlPointDriverController() {
		super();
	}

	// Creation ---------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int routeId) {
		ModelAndView result;
		ControlPoint controlpoint;
		
		controlpoint = this.controlPointService.create(routeId);
		//Assert.isTrue(controlpoint.getRoute().getReservations().isEmpty());

		result = this.createEditModelAndView(controlpoint);

		return result;
	}
	

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final ControlPoint controlpoint, final BindingResult binding) {
		
		Assert.isTrue(controlpoint.getRoute().getDriver().getId() == this.actorService.findByPrincipal().getId());
		
		
		ModelAndView result;		
		if (binding.hasErrors()){
			System.out.println(binding.getAllErrors());
			result = this.createEditModelAndView(controlpoint);
		}
		else{
			try {
				this.controlPointService.save(controlpoint);
				result = new ModelAndView("redirect:/controlpoint/list.do?routeId="+ controlpoint.getRoute().getId());
			} catch (final Throwable oops) {
				oops.printStackTrace();
				result = this.createEditModelAndView(controlpoint, "controlpoint.commit.error");
			}
		}
		return result;
	}

	// Ancilliary methods ----------------------------------------------------------------
	private ModelAndView createEditModelAndView(final ControlPoint controlpoint) {
		ModelAndView result;

		result = this.createEditModelAndView(controlpoint, null);

		return result;
	}

	private ModelAndView createEditModelAndView(final ControlPoint controlpoint, final String message) {
		ModelAndView result;
		String requestURI;

		requestURI = "controlpoint/driver/edit.do";
		result = new ModelAndView("controlpoint/driver/create");
		result.addObject("controlpoint", controlpoint);
		result.addObject("message", message);
		result.addObject("requestURI", requestURI);

		return result;
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
