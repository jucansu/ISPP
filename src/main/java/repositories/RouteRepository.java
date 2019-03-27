
package repositories;

import java.util.Collection;
import java.util.Date;

import org.joda.time.LocalTime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.LuggageSize;
import domain.ReservationStatus;
import domain.Route;
import domain.VehicleType;

@Repository
public interface RouteRepository extends JpaRepository<Route, Integer> {

	@Query("select r from Route r join r.reservations res where res.passenger.id=?1 and res.status != ?2 and res.status != ?3 and r.isCancelled = FALSE")
	Collection<Route> findActiveRoutesByPassenger(int passengerId, ReservationStatus statusCancelled, ReservationStatus statusRejected);	//Cuando se llame desde el servicio se le pasará como parametro el estado de reserva cancelada Y denegada

	@Query("select r from Route r where r.driver.id=?1 and r.departureDate>?2 and r.isCancelled = FALSE ")
	Collection<Route> findActiveRoutesByDriver(int driverId, Date now);	//Cuando se llame desde el servicio se le pasará como parametro la fecha y hora actual

	//	select b from Route b where (?1 is null or ?1='' or b.departureDate = ?1) and (?2 is null or ?2='' or b.origin like ?2)  and (?3 is null or ?3=''or b.destination like  ?3) and (?4 is null or b.vehicle.type =  ?4) and (?5 is null or b.availableSeats >= ?5) and (?6 is null or b.maxLugagge =  ?6) and (?7 is null or b.driver.pets = true) and (?8 is null or b.driver.childs = true) and (?9 is null or b.driver.smoke = true) and (?10 is null or b.driver.music = true)

	//@Query("select b from Route b where (?1 is null or b.departureDate = ?1) and (?2 is null or ?2=' ' or b.origin like ?2) and (?3 is null or ?3=' 'or b.destination like ?3) and (?4 is null or b.vehicle.type = ?4) and (?5 is null or b.availableSeats >= ?5) and (?6 is null or b.maxLuggage = ?6) and (?7 is null or b.driver.pets = ?7) and (?8 is null or b.driver.childs = ?8) and (?9 is null or b.driver.smoke = ?9) and (?10 is null or b.driver.music = ?10)")
	@Query("select b from Route b where (?1 is null or ?1=' ' or b.origin like ?1) and (?2 is null or ?2=' 'or b.destination like ?2) and (?3 is null or b.vehicle.type = ?3) and (?4 is null or b.availableSeats >= ?4) and (?5 is null or b.maxLuggage = ?5) and (?6 is null or b.driver.pets = ?6) and (?7 is null or b.driver.childs = ?7) and (?8 is null or b.driver.smoke = ?8) and (?9 is null or b.driver.music = ?9)")
	Collection<Route> searchRoutes(String origin, String destination, VehicleType vehicleType, Integer availableSeats, LuggageSize maxLuggage, Boolean pets, Boolean childs, Boolean smoke, Boolean music);

	@Query("select r from Route r")
	Collection<Route> findRoutesByTimeStart(LocalTime timeStart);

	@Query("select r from Route r")
	Collection<Route> findRoutesByTimeEnd(LocalTime timeEnds);

	@Query("select r from Route r")
	Collection<Route> findRoutesByTimeRange(LocalTime timeStart, LocalTime timeEnds);

}
