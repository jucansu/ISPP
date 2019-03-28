
package services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;

import org.decimal4j.util.DoubleRounder;
import org.joda.time.LocalTime;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.RouteRepository;
import domain.ControlPoint;
import domain.Driver;
import domain.Finder;
import domain.LuggageSize;
import domain.Reservation;
import domain.ReservationStatus;
import domain.Route;
import domain.VehicleType;

@Service
@Transactional
public class RouteService {

	//Managed repository

	@Autowired
	private RouteRepository	routeRepository;

	//Supporting services

	@Autowired
	private ActorService	actorService;


	//Simple CRUD methods

	public Route create() {
		final Route r = new Route();

		final Driver d = (Driver) this.actorService.findByPrincipal();
		r.setDriver(d);
		r.setIsCancelled(false);
		r.setReservations(new ArrayList<Reservation>());
		r.setControlPoints(new ArrayList<ControlPoint>());
		r.setDaysRepeat("");
		r.setEstimatedDuration(1);

		return r;
	}

	public Route findOne(final int id) {
		Assert.notNull(id);

		return this.routeRepository.findOne(id);
	}

	public Collection<Route> findAll() {
		return this.routeRepository.findAll();
	}

	public Route save(final Route r) {
		Assert.notNull(r);
		Double distance = 0.0;
		Double price = 0.0;
		final Date date = new Date();
		Assert.isTrue(r.getDepartureDate().after(date));

		//Assertion that the user modifying this task has the correct privilege.

		Assert.isTrue(this.actorService.findByPrincipal().getId() == r.getDriver().getId());

		//Assertion that the avaliable seats  isn't a bigger value than the vehicle capacity
		Assert.isTrue(r.getAvailableSeats() < r.getVehicle().getSeatsCapacity());
		//
		//		if (r.getId() == 0 || r.getControlPoints().size() < 2) {
		//			r.setDestination("NONE");
		//			r.setOrigin("NONE");
		//		} else if (r.getControlPoints().size() >= 2) {
		//			final List<ControlPoint> cps = new ArrayList<ControlPoint>(r.getControlPoints());
		//			Collections.sort(cps);
		//
		//			for (int a = 0; a < r.getControlPoints().size() - 1; a++) {
		//				final long diffInMillies = cps.get(a + 1).getArrivalTime().getTime() - cps.get(a).getArrivalTime().getTime();
		//				estimatedDuration = (int) (estimatedDuration + TimeUnit.MINUTES.convert(diffInMillies, TimeUnit.MINUTES));
		//				distance = distance + this.getDistance(cps.get(a).getLocation(), cps.get(a + 1).getLocation());
		//			}
		//			price = this.getPrice(distance);
		//
		//			r.setOrigin(cps.get(0).getLocation());
		//			r.setDestination(cps.get(cps.size() - 1).getLocation());
		//		}
		final String origin = r.getOrigin();
		final String destination = r.getDestination();
		distance = this.getDistance(origin, destination);
		price = this.getPrice(distance);
		r.setPricePerPassenger(price);
		r.setDistance(distance);
		final Route saved = this.routeRepository.save(r);

		return saved;
	}

	public void cancel(final Route r) {
		Assert.notNull(r);

		//Assertion that the user deleting this task has the correct privilege.
		Assert.isTrue(this.actorService.findByPrincipal().getId() == r.getDriver().getId());

		r.setIsCancelled(true);

		this.routeRepository.save(r);
	}

	//	public void delete2(Route route) {
	//		Assert.notNull(route);
	//
	//		//Assertion that the user deleting this note has the correct privilege.
	//
	//		Assert.isTrue(this.actorService.findByPrincipal().getId() == route.getDriver().getId());
	//		//Also, we delete the reservations related with the deleted route
	//		if (!(route.getReservations().isEmpty()))
	//			for (Reservation r : route.getReservations())
	//				this.reservationService.delete(r);
	//
	//		this.routeRepository.delete(route);
	//	}

	public Double getDistance(final String origin, final String destination) {
		Double value = 0.0;
		try {
			final String url = "https://maps.googleapis.com/maps/api/directions/json?origin=" + origin.replaceAll(" ", "+") + "&destination=" + destination.replaceAll(" ", "+") + "&key=AIzaSyAKoI-jZJQyPjIp1XGUSsbWh47JBix7qws";
			final URL obj = new URL(url);
			final HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0");
			final BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			final StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null)
				response.append(inputLine);
			in.close();

			final JSONObject myResponse = new JSONObject(response.toString());

			final JSONArray routes = myResponse.getJSONArray("routes");
			final JSONObject obj1 = routes.getJSONObject(0);
			final JSONArray dst = obj1.getJSONArray("legs");
			final JSONObject obj2 = dst.getJSONObject(0);
			final JSONObject obj3 = obj2.getJSONObject("distance");
			value = obj3.getDouble("value");
			value = value / 1000;
		} catch (final Exception e) {
			e.printStackTrace();
		}
		return DoubleRounder.round(value, 2);

	}

	public Double getPrice(final Double distance) {
		Double price = 0.0;
		final Double price3km = 0.33;
		final Double profit = 0.10;
		if (distance < 9.0)
			price = 1 + profit;
		else {
			final String str = String.valueOf(distance / 3);
			final Integer intNumber = Integer.parseInt(str.substring(0, str.indexOf('.')));
			price = intNumber * price3km + profit;

		}
		return DoubleRounder.round(price, 2);
	}

	//Finder 

	public Collection<Route> searchRoutes(final Finder finder) {
		Assert.notNull(finder);
		Assert.isTrue(finder.getAvailableSeats() != null); //No podemos buscar rutas con asientos a null
		Assert.isTrue(!finder.getOrigin().isEmpty() || !finder.getDestination().isEmpty()); // Cada vez que busquemos tenemos que tener puesto origen o destino
		//Assert.isTrue(finder.getDestinationTime().isAfter(finder.getOriginTime())); //El tiempo maximo debe ser después que el minimo (faltaria comprobar qué pasa si en los dos casos hay el mismo valor)

		if (finder.getDepartureDate() != null) { //Solamente podemos buscar rutas que sean del día actual hasta el futuro
			final Calendar de = Calendar.getInstance();
			final Calendar now = Calendar.getInstance();
			de.setTime(finder.getDepartureDate());
			now.setTime(new Date());
			Assert.isTrue(de.get(Calendar.DAY_OF_YEAR) >= now.get(Calendar.DAY_OF_YEAR));
		}

		Collection<Route> result;
		final Collection<Route> acum;
		Collection<Route> allRoutes;

		final Date departureDate = finder.getDepartureDate();
		final LocalTime timeStart = finder.getOriginTime();
		final LocalTime timeEnds = finder.getDestinationTime();
		final String origin = finder.getOrigin();
		final String destination = finder.getDestination();
		final VehicleType vehicleType = finder.getVehicleType();
		final Integer availableSeats = finder.getAvailableSeats();
		final LuggageSize luggageSize = finder.getLuggageSize();
		final Boolean pets = finder.getPets();
		final Boolean childs = finder.getChilds();
		final Boolean smoke = finder.getSmoke();
		final Boolean music = finder.getMusic();

		final Calendar departureDateC = Calendar.getInstance();

		if (departureDate != null)
			departureDateC.setTime(departureDate);

		//Diferenciamos entre si está todo el formulario a null o no, si es así devolvemos todas las rutas

		if (departureDate == null && timeStart == null && timeEnds == null && (origin == null || origin.isEmpty())
			&& (destination == null || destination.isEmpty() && vehicleType == null && availableSeats == null && luggageSize == null && pets == null && childs == null && smoke == null && music == null)) {

			allRoutes = new HashSet<Route>();
			allRoutes = this.routeRepository.findAll();

			Assert.notNull(allRoutes);
			result = allRoutes;
		} else { //En el caso de que haya algo que no sea null, se empieza el filtraje

			acum = new HashSet<Route>();
			allRoutes = new HashSet<Route>();
			allRoutes = this.routeRepository.findAll();

			for (final Route r : allRoutes) {

				final Calendar rutaC = Calendar.getInstance();
				rutaC.setTime(r.getDepartureDate());

				if ((r.getIsCancelled() == false) && (r.getAvailableSeats() >= availableSeats || availableSeats == null) && (r.getMaxLuggage().equals(luggageSize) || luggageSize == null) && (r.getDriver().getChilds() == childs)
					&& (r.getDriver().getSmoke() == smoke) && (r.getDriver().getMusic() == music) && (r.getDriver().getPets() == pets) && (r.getOrigin().toLowerCase().contains(origin.toLowerCase()) || origin.isEmpty())
					&& (r.getDestination().toLowerCase().contains(destination.toLowerCase()) || destination.isEmpty()) && (r.getVehicle().getType().equals(vehicleType) || vehicleType == null)
					&& (((rutaC.get(Calendar.DAY_OF_YEAR) == departureDateC.get(Calendar.DAY_OF_YEAR)) && (rutaC.get(Calendar.YEAR) == departureDateC.get(Calendar.YEAR))) || departureDate == null))
					if ((timeEnds == null) && (rutaC.get(Calendar.HOUR_OF_DAY) > timeStart.getHourOfDay()))
						acum.add(r);
					else if ((timeEnds == null) && (rutaC.get(Calendar.HOUR_OF_DAY) == timeStart.getHourOfDay()) && (rutaC.get(Calendar.MINUTE) >= timeStart.getMinuteOfHour()))
						acum.add(r);
					else if ((timeStart == null) && (rutaC.get(Calendar.HOUR_OF_DAY) < timeEnds.getHourOfDay()))
						acum.add(r);
					else if ((timeStart == null) && (rutaC.get(Calendar.HOUR_OF_DAY) == timeEnds.getHourOfDay()) && (rutaC.get(Calendar.MINUTE) <= timeEnds.getMinuteOfHour()))
						acum.add(r);
					else if ((rutaC.get(Calendar.HOUR_OF_DAY) > timeStart.getHourOfDay()) && (rutaC.get(Calendar.HOUR_OF_DAY) < timeEnds.getHourOfDay()))
						acum.add(r);
					else if ((rutaC.get(Calendar.HOUR_OF_DAY) == timeStart.getHourOfDay()) && (rutaC.get(Calendar.MINUTE) >= timeStart.getMinuteOfHour()))
						acum.add(r);
					else if ((rutaC.get(Calendar.HOUR_OF_DAY) == timeEnds.getHourOfDay()) && (rutaC.get(Calendar.MINUTE) <= timeEnds.getMinuteOfHour()))
						acum.add(r);

			}

			result = acum;

		}

		return result;
	}
	public Collection<Route> findActiveRoutesByPassenger(final int passengerId) {
		Assert.isTrue(passengerId != 0);

		Collection<Route> routes, result;
		final Date now = new Date();

		routes = this.routeRepository.findActiveRoutesByPassenger(passengerId, ReservationStatus.CANCELLED, ReservationStatus.REJECTED);
		result = new ArrayList<Route>();
		for (final Route r : routes) {
			final Calendar date = Calendar.getInstance();
			date.setTime(r.getDepartureDate());
			final long departureDateMilis = date.getTimeInMillis();
			final Date arrivalDate = new Date(departureDateMilis + (r.getEstimatedDuration() * 60000));
			System.out.println("--------------");
			System.out.println(r.getDepartureDate() + "->" + arrivalDate);

			if (arrivalDate.after(now))
				result.add(r);
		}

		return result;
	}

	public Collection<Route> findActiveRoutesByDriver(final int driverId, final Date now) {
		Assert.isTrue(driverId != 0);
		Assert.notNull(now);

		Collection<Route> result;

		result = this.routeRepository.findActiveRoutesByDriver(driverId, now);

		return result;
	}

}
