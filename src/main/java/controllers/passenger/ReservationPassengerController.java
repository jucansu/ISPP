/*
 * ReservationController.java
 * 
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package controllers.passenger;

import java.util.Collection;

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

import services.ReservationService;
import services.RouteService;
import controllers.AbstractController;
import domain.Reservation;
import domain.Route;

@Controller
@RequestMapping("/reservation/passenger")
public class ReservationPassengerController extends AbstractController {

	@Autowired
	private ReservationService	reservationService;
	@Autowired
	private RouteService		routeService;


	// Constructor --------------------------------------------------------
	public ReservationPassengerController() {
		super();
	}
	// Create ---------------------------------------------------------------		

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int routeId) {
		ModelAndView result;
		Route route;
		Reservation reservation;

		route = this.routeService.findOne(routeId);
		reservation = this.reservationService.create();
		reservation.setRoute(route);

		result = this.createEditModelAndView(reservation);

		return result;
	}

	public ModelAndView save(@Valid final Reservation reservation, final BindingResult binding) {
		ModelAndView result;
		Route route;

		for (final ObjectError oe : binding.getAllErrors())
			System.out.println(oe);

		if (binding.hasErrors())
			result = this.createEditModelAndView(reservation);
		else
			try {
				this.reservationService.save(reservation);
				route = reservation.getRoute();
				result = new ModelAndView("route/passenger/display.do?routeId=" + route.getId());	//TODO: aun por ver adonde redirigira
			} catch (final Throwable oops) {
				oops.printStackTrace();
				result = this.createEditModelAndView(reservation, "reservation.commit.error");
			}
		return result;
	}

	// Action-2 ---------------------------------------------------------------		

	@RequestMapping("/action-2")
	public ModelAndView action2() {
		ModelAndView result;

		result = new ModelAndView("reservation/action-2");

		return result;
	}

	//Ancilliary methods

	private ModelAndView createEditModelAndView(final Reservation reservation) {
		ModelAndView result;

		result = this.createEditModelAndView(reservation, null);

		return result;
	}

	private ModelAndView createEditModelAndView(final Reservation reservation, final String message) {
		ModelAndView result;
		Route route;
		//		Collection<String> places;
		Collection<Reservation> routeAcceptedReservations;
		Integer remainingSeats;

		route = reservation.getRoute();

		//---Lista de strings de lugares por donde pasa la ruta---
		//		places = new ArrayList<String>();
		//		places.add(route.getOrigin());

		//	if (route.getControlPoints() != null && !route.getControlPoints().isEmpty())
		//	for (final ControlPoint c : route.getControlPoints()) 
		//		places.add(c.getLocation());
		//		places.add(route.getDestination());
		//-----------------------------------------------------

		//------------Asientos restantes--------------------
		routeAcceptedReservations = this.reservationService.findAcceptedReservationsByRoute(route.getId());
		remainingSeats = route.getAvailableSeats() - routeAcceptedReservations.size();

		//Comprobamos que haya asientos disponibles
		Assert.isTrue(remainingSeats > 0);
		//------------------------------------------------------

		result = new ModelAndView("reservation/passenger/create");
		result.addObject("reservation", reservation);
		result.addObject("route", route);
		//		result.addObject("places", places);
		result.addObject("remainingSeats", remainingSeats);
		result.addObject("message", message);

		return result;
	}

	// Action-2 ---------------------------------------------------------------		

	@RequestMapping("/action-3")
	public ModelAndView action3() {
		throw new RuntimeException("Oops! An *expected* exception was thrown. This is normal behaviour.");
	}

}
