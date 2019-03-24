
package services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.decimal4j.util.DoubleRounder;
import org.joda.time.LocalDateTime;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.RouteRepository;
import domain.ControlPoint;
import domain.Driver;
import domain.LuggageSize;
import domain.Reservation;
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

		r.setReservations(new ArrayList<Reservation>());
		r.setControlPoints(new ArrayList<ControlPoint>());
		r.setIsCancelled(false);

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
		if (r.getId() != 0)
			Assert.isTrue(this.actorService.findByPrincipal().getId() == r.getDriver().getId());

		if (r.getId() == 0 || r.getControlPoints().isEmpty()) {
			distance = this.getDistance(r.getOrigin(), r.getDestination());
			price = this.getPrice(distance);
		} else {
			final List<ControlPoint> cps = new ArrayList<ControlPoint>(r.getControlPoints());
			distance = this.getDistance(r.getOrigin(), cps.get(0).getText());
			for (int a = 0; a < r.getControlPoints().size(); a++)
				distance = distance + this.getDistance(cps.get(a).getText(), cps.get(a + 1).getText());
			distance = distance + this.getDistance(cps.get(cps.size() - 1).getText(), r.getDestination());
			price = this.getPrice(distance);
		}
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

	//	public void delete2(final Route route) {
	//		Assert.notNull(route);
	//
	//		//Assertion that the user deleting this note has the correct privilege.
	//
	//		Assert.isTrue(this.actorService.findByPrincipal().getId() == route.getDriver().getId());
	//		//Also, we delete the reservations related with the deleted route
	//		if (!(route.getReservations().isEmpty()))
	//			for (final Reservation r : route.getReservations())
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

	public Collection<Route> finderSearch(final LocalDateTime departureDate, final String origin, final String destination, final VehicleType vehicleType, final Integer aviableSeats, final LuggageSize luggageSize, final Boolean pets, final Boolean childs,
		final Boolean smoke, final Boolean music) {
		Collection<Route> result;

		result = this.routeRepository.finderSearch(departureDate, origin, destination, vehicleType, aviableSeats, luggageSize, pets, childs, smoke, music);

		return result;
	}

}
