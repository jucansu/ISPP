/*
 * ReservationController.java
 * 
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package controllers.driver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ReservationService;
import services.RouteService;
import controllers.AbstractController;
import domain.Reservation;
import domain.Route;

@Controller
@RequestMapping("/reservation/driver")
public class ReservationDriverController extends AbstractController {

	@Autowired
	private ReservationService	reservationService;
	@Autowired
	private RouteService		routeService;


	// Constructor --------------------------------------------------------
	public ReservationDriverController() {
		super();
	}
	
	
	// Accept Reservation ---------------------------------------------------------------		

	@RequestMapping(value="/acceptReservation", method=RequestMethod.POST, params = "acceptReservation")
	public ModelAndView acceptReservation(@RequestParam(defaultValue = "0") int reservationId){
		ModelAndView res;
		Reservation reservation = reservationService.findOne(reservationId);
		Route route = reservation.getRoute();

		try{
			this.reservationService.acceptReservation(reservationId);
			res = new ModelAndView("redirect:/route/display.do?routeId=" + route.getId());

		}catch (Exception e) {
			res = new ModelAndView("redirect:/route/display.do?routeId=" + route.getId());
		}
		
		return res;
	}
	
	// Reject Reservation ---------------------------------------------------------------
	
	@RequestMapping(value="/rejectReservation", method=RequestMethod.POST, params = "reservation")
	public ModelAndView rejectReservation(@RequestParam(defaultValue = "0") int reservationId){
		ModelAndView res;
		Reservation reservation = reservationService.findOne(reservationId);
		Route route = routeService.findOne(reservation.getRoute().getId());

		try{
			this.reservationService.rejectReservation(reservationId);
			res = new ModelAndView("redirect:/route/display.do" + route.getId());

		}catch (Exception e) {
			res = new ModelAndView("redirect:/route/display.do" + route.getId());
		}
		
		return res;
	}

}
