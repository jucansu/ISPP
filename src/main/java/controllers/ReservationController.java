/*
 * ReservationController.java
 * 
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import security.UserAccount;
import services.ActorService;
import services.ReservationService;
import domain.Actor;
import domain.Driver;
import domain.Passenger;
import domain.Reservation;

@Controller
@RequestMapping("/reservation")
public class ReservationController extends AbstractController {

	@Autowired
	private ReservationService	reservationService;

	@Autowired
	private ActorService		actorService;


	// Display ---------------------------------------------------------------		

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int reservationId) {
		Assert.notNull(reservationId);
		ModelAndView res;
		Reservation reservation;
		UserAccount ua;
		Actor actor = this.actorService.findByPrincipal();
		Driver driver = null;
		Passenger passenger = null;

		if (actor instanceof Passenger) {

			passenger = (Passenger) actor;

		} else if (actor instanceof Driver) {

			driver = (Driver) actor;

		} else {

			Assert.isTrue(1 == 0, "El usuario no es ni Drive ni Passenger");

		}

		reservation = this.reservationService.findOne(reservationId);
		Assert.isTrue((reservation.getPassenger().getId() == passenger.getId()) || reservation.getRoute().getDriver().getId() == driver.getId());

		res = new ModelAndView("reservation/display");

		res.addObject("reservation", reservation);

		return res;

	}

	// Listing ---------------------------------------------------------------		

	@RequestMapping("/action-3")
	public ModelAndView action3() {
		throw new RuntimeException("Oops! An *expected* exception was thrown. This is normal behaviour.");
	}

}
