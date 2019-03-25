
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
import domain.Finder;
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
		Route r = new Route();

		Driver d = (Driver) this.actorService.findByPrincipal();
		r.setDriver(d);

		r.setReservations(new ArrayList<Reservation>());
		r.setControlPoints(new ArrayList<ControlPoint>());
		r.setIsCancelled(false);

		return r;
	}

	public Route findOne(int id) {
		Assert.notNull(id);

		return this.routeRepository.findOne(id);
	}

	public Collection<Route> findAll() {
		return this.routeRepository.findAll();
	}

	public Route save(Route r) {
		Assert.notNull(r);
		Double distance = 0.0;
		Double price = 0.0;
		Date date = new Date();
		Assert.isTrue(r.getDepartureDate().after(date));

		//Assertion that the user modifying this task has the correct privilege.
		if (r.getId() != 0)
			Assert.isTrue(this.actorService.findByPrincipal().getId() == r.getDriver().getId());

		if (r.getId() == 0 || r.getControlPoints().isEmpty()) {
			distance = this.getDistance(r.getOrigin(), r.getDestination());
			price = this.getPrice(distance);
		} else {
			List<ControlPoint> cps = new ArrayList<ControlPoint>(r.getControlPoints());
			distance = this.getDistance(r.getOrigin(), cps.get(0).getText());
			for (int a = 0; a < r.getControlPoints().size(); a++)
				distance = distance + this.getDistance(cps.get(a).getText(), cps.get(a + 1).getText());
			distance = distance + this.getDistance(cps.get(cps.size() - 1).getText(), r.getDestination());
			price = this.getPrice(distance);
		}
		r.setPricePerPassenger(price);
		r.setDistance(distance);

		Route saved = this.routeRepository.save(r);

		return saved;
	}
	public void cancel(Route r) {
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

	public Double getDistance(String origin, String destination) {
		Double value = 0.0;
		try {
			String url = "https://maps.googleapis.com/maps/api/directions/json?origin=" + origin.replaceAll(" ", "+") + "&destination=" + destination.replaceAll(" ", "+") + "&key=AIzaSyAKoI-jZJQyPjIp1XGUSsbWh47JBix7qws";
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0");
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null)
				response.append(inputLine);
			in.close();

			JSONObject myResponse = new JSONObject(response.toString());

			JSONArray routes = myResponse.getJSONArray("routes");
			JSONObject obj1 = routes.getJSONObject(0);
			JSONArray dst = obj1.getJSONArray("legs");
			JSONObject obj2 = dst.getJSONObject(0);
			JSONObject obj3 = obj2.getJSONObject("distance");
			value = obj3.getDouble("value");
			value = value / 1000;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return DoubleRounder.round(value, 2);

	}

	public Double getPrice(Double distance) {
		Double price = 0.0;
		Double price3km = 0.33;
		Double profit = 0.10;
		if (distance < 9.0)
			price = 1 + profit;
		else {
			String str = String.valueOf(distance / 3);
			Integer intNumber = Integer.parseInt(str.substring(0, str.indexOf('.')));
			price = intNumber * price3km + profit;

		}
		return DoubleRounder.round(price, 2);
	}

	//Finder 

	public Collection<Route> searchRoutes(Finder finder) {
		Collection<Route> result;

		LocalDateTime departureDate = finder.getDepartureDate();
		String origin = finder.getOrigin();
		String destination = finder.getDestination();
		VehicleType vehicleType = finder.getVehicleType();
		Integer availableSeats = finder.getAvailableSeats();
		LuggageSize luggageSize = finder.getLuggageSize();
		Boolean pets = finder.getPets();
		Boolean childs = finder.getChilds();
		Boolean smoke = finder.getSmoke();
		Boolean music = finder.getMusic();

		result = this.routeRepository.searchRoutes(null, null, null, null, null, null, pets, childs, smoke, music);

		return result;
	}
}
