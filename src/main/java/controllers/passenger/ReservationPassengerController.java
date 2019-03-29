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

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

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

import security.LoginService;
import security.UserAccount;
import services.ActorService;
import services.ReservationService;
import services.RouteService;
import controllers.AbstractController;
import domain.Actor;
import domain.Administrator;
import domain.Driver;
import domain.Passenger;
import domain.Reservation;
import domain.ReservationStatus;
import domain.Route;

@Controller
@RequestMapping("/reservation/passenger")
public class ReservationPassengerController extends AbstractController {

	@Autowired
	private ReservationService	reservationService;
	@Autowired
	private RouteService		routeService;
	@Autowired
	private ActorService		actorService;


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
		UserAccount ua;
		Passenger passenger;

		ua = LoginService.getPrincipal();
		passenger = (Passenger) this.actorService.findByUserAccount(ua);
		Assert.notNull(passenger);

		route = this.routeService.findOne(routeId);
		System.out.println("---------------------------------");

		reservation = this.reservationService.create();
		System.out.println("---------------------------------");
		reservation.setRoute(route);
		reservation.setPrice(route.getPricePerPassenger());
		reservation.setPassenger(passenger);

		System.out.println("--------" + reservation);

		result = this.createEditModelAndView(reservation);

		return result;
	}
	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
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

	// Confirmacion de que conductor me ha recogido ---------------------------------------------------------------		

	@RequestMapping(value = "/driverPickUp", method = RequestMethod.GET)
	public ModelAndView driverPickUp(final int reservationId) {
		ModelAndView result;

		this.reservationService.driverPickedMe(reservationId);
		result = new ModelAndView("reservation/passenger/driverPickUp");

		//TENGO QUE PASARLE OTRA VEZ TODA LA INFO QUE HAY EN EL DISPLAY DE ROUTE

		Route route;
		Collection<Reservation> reservations, displayableReservations;
		Integer occupiedSeats;
		UserAccount ua;
		Actor actor;
		Integer rol = 0;	//1->conductor de la ruta | 2->pasajero con reserva | 3-> pasajero sin reserva | 4->admin
		Reservation reservation;
		final Reservation currentReservation;
		boolean startedRoute = false;
		boolean hasPassed10Minutes = false;
		boolean hasPassed20Minutes = false;

		currentReservation = this.reservationService.findOne(reservationId);
		route = currentReservation.getRoute();
		Assert.notNull(route);
		reservation = this.reservationService.create();
		reservation.setRoute(route);

		reservations = route.getReservations();
		System.out.println(reservations);
		displayableReservations = new ArrayList<Reservation>();
		occupiedSeats = 0;
		ua = LoginService.getPrincipal();
		actor = this.actorService.findByUserAccount(ua);
		Assert.notNull(actor);

		if (reservations != null && reservations.size() > 0)
			for (final Reservation res : reservations) {
				if (res.getStatus().equals(ReservationStatus.ACCEPTED)) {
					occupiedSeats++;		//Contamos asientos ocupados
					displayableReservations.add(res);	//añadimos las reservas aceptadas
				}
				if (actor instanceof Driver) {
					final Driver driver = (Driver) actor;
					if (route.getDriver().equals(driver)) {				//Si el conductor logeado es el de la ruta...
						rol = 1;							//...se considerará como "conductor de la ruta"...
						if (route.getDepartureDate().after(new Date()))	// ...y además si la ruta no ha empezado...
							if (res.getStatus().equals(ReservationStatus.PENDING))
								displayableReservations.add(res);	//...añadimos tambien reservas pendientes
					}
				}

				if (actor instanceof Passenger) {					//Si el actor logueado es pasajero...
					final Passenger passenger = (Passenger) actor;
					for (final Reservation r : reservations)
						//...y ha hecho alguna reserva en la ruta
						if (r.getPassenger().equals(passenger)) {
							rol = 2;		//...se considerara como "pasajero con reserva" 
							result.addObject("reservation", r);
							if (route.getDepartureDate().before(new Date()))
								startedRoute = true;
							break;
						} else
							rol = 3;		//si no, se considera "pasajero sin reserva"
				}

				if (actor instanceof Administrator)
					rol = 4;
			}

		//----proceso para conseguir la fecha de llegada---
		final Calendar date = Calendar.getInstance();
		date.setTime(route.getDepartureDate());
		final long departureDateMilis = date.getTimeInMillis();
		final Date arrivalDate = new Date(departureDateMilis + route.getEstimatedDuration() * 60000);
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		sdf.format(arrivalDate);
		//------------------------------------------------

		//----proceso para conseguir la fecha de salida + 10 minutos---
		final Date tenMinutesAfterDeparture = new Date(departureDateMilis + 600000);
		if (new Date().after(tenMinutesAfterDeparture))
			hasPassed10Minutes = true;
		//----proceso para conseguir la fecha de salida + 10 minutos---
		final Date twentyMinutesAfterDeparture = new Date(departureDateMilis + (600000 * 2));
		if (new Date().after(twentyMinutesAfterDeparture))
			hasPassed20Minutes = true;
		//------------------------------------------------
		result.addObject("route", route);
		result.addObject("remainingSeats", route.getAvailableSeats() - occupiedSeats);
		result.addObject("arrivalDate", sdf.format(arrivalDate));
		result.addObject("reservations", displayableReservations);
		result.addObject("rol", rol);
		result.addObject("newReservation", reservation);
		result.addObject("startedRoute", startedRoute);
		result.addObject("hasPassed10Minutes", hasPassed10Minutes);
		result.addObject("hasPassed20Minutes", hasPassed20Minutes);

		return result;
	}
	// Confirmacion de que conductor NO me ha recogido ---------------------------------------------------------------		

	@RequestMapping(value = "/driverNoPickUp", method = RequestMethod.GET)
	public ModelAndView driverNoPickUp(final int reservationId) {
		ModelAndView result;

		this.reservationService.driverNoPickedMe(reservationId);
		result = new ModelAndView("reservation/passenger/driverNoPickUp");

		//TENGO QUE PASARLE OTRA VEZ TODA LA INFO QUE HAY EN EL DISPLAY DE ROUTE

		Route route;
		Collection<Reservation> reservations, displayableReservations;
		Integer occupiedSeats;
		UserAccount ua;
		Actor actor;
		Integer rol = 0;	//1->conductor de la ruta | 2->pasajero con reserva | 3-> pasajero sin reserva | 4->admin
		Reservation reservation;
		final Reservation currentReservation;
		boolean startedRoute = false;
		boolean hasPassed10Minutes = false;
		boolean hasPassed20Minutes = false;

		currentReservation = this.reservationService.findOne(reservationId);
		route = currentReservation.getRoute();
		Assert.notNull(route);
		reservation = this.reservationService.create();
		reservation.setRoute(route);

		reservations = route.getReservations();
		displayableReservations = new ArrayList<Reservation>();
		occupiedSeats = 0;
		ua = LoginService.getPrincipal();
		actor = this.actorService.findByUserAccount(ua);
		Assert.notNull(actor);

		if (reservations != null && reservations.size() > 0)
			for (final Reservation res : reservations) {
				if (res.getStatus().equals(ReservationStatus.ACCEPTED)) {
					occupiedSeats++;		//Contamos asientos ocupados
					displayableReservations.add(res);	//añadimos las reservas aceptadas
				}
				if (actor instanceof Driver) {
					final Driver driver = (Driver) actor;
					if (route.getDriver().equals(driver)) {				//Si el conductor logeado es el de la ruta...
						rol = 1;							//...se considerará como "conductor de la ruta"...
						if (route.getDepartureDate().after(new Date()))	// ...y además si la ruta no ha empezado...
							if (res.getStatus().equals(ReservationStatus.PENDING))
								displayableReservations.add(res);	//...añadimos tambien reservas pendientes
					}
				}

				if (actor instanceof Passenger) {					//Si el actor logueado es pasajero...
					final Passenger passenger = (Passenger) actor;
					for (final Reservation r : reservations)
						//...y ha hecho alguna reserva en la ruta
						if (r.getPassenger().equals(passenger)) {
							rol = 2;		//...se considerara como "pasajero con reserva" 
							result.addObject("reservation", r);
							if (route.getDepartureDate().before(new Date()))
								startedRoute = true;
							break;
						} else
							rol = 3;		//si no, se considera "pasajero sin reserva"
				}

				if (actor instanceof Administrator)
					rol = 4;
			}

		//----proceso para conseguir la fecha de llegada---
		final Calendar date = Calendar.getInstance();
		date.setTime(route.getDepartureDate());
		final long departureDateMilis = date.getTimeInMillis();
		final Date arrivalDate = new Date(departureDateMilis + route.getEstimatedDuration() * 60000);
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		sdf.format(arrivalDate);
		//------------------------------------------------

		//----proceso para conseguir la fecha de salida + 10 minutos---
		final Date tenMinutesAfterDeparture = new Date(departureDateMilis + 600000);
		if (new Date().after(tenMinutesAfterDeparture))
			hasPassed10Minutes = true;
		//----proceso para conseguir la fecha de salida + 20 minutos---
		final Date twentyMinutesAfterDeparture = new Date(departureDateMilis + (600000 * 2));
		if (new Date().after(twentyMinutesAfterDeparture))
			hasPassed20Minutes = true;
		//------------------------------------------------
		result.addObject("route", route);
		result.addObject("remainingSeats", route.getAvailableSeats() - occupiedSeats);
		result.addObject("arrivalDate", sdf.format(arrivalDate));
		result.addObject("reservations", displayableReservations);
		result.addObject("rol", rol);
		result.addObject("newReservation", reservation);
		result.addObject("startedRoute", startedRoute);
		result.addObject("hasPassed10Minutes", hasPassed10Minutes);
		result.addObject("hasPassed20Minutes", hasPassed20Minutes);

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

	@RequestMapping("/driverPickMe")
	public ModelAndView action3() {
		throw new RuntimeException("Oops! An *expected* exception was thrown. This is normal behaviour.");
	}

}
