
package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.CommentService;
import domain.Comment;

@Controller
@RequestMapping("/comment")
public class CommentController extends AbstractController {

	@Autowired
	private CommentService	commentService;


	// Constructor ------------------------------
	public CommentController() {
		super();
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid Comment comment, BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.println(binding.getAllErrors().toString());
			result = this.createEditModelAndView(passenger, "passenger/create");
		} else
			try {
				userAccount = super.hashSavePassword(passenger.getUserAccount());
				passenger.setUserAccount(userAccount);
				this.passengerService.save(passenger);
				result = new ModelAndView("redirect:/security/login.do");
			} catch (Throwable oops) {
				result = this.createEditModelAndView(passenger, "passenger.commit.error");
			}
		return result;
	}

}
