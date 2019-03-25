
package repositories;

import java.util.Collection;
import java.util.Date;

import org.joda.time.LocalDateTime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.LuggageSize;
import domain.ReservationStatus;
import domain.Route;
import domain.VehicleType;

@Repository
public interface RouteRepository extends JpaRepository<Route, Integer> {

	@Query("select r from Route r join r.reservations res where res.passenger.id=?1 and r.departureDate>?2 and res.status != ?3 and r.isCancelled = FALSE")
	Collection<Route> findActiveRoutesByPassenger(int passengerId, Date now, ReservationStatus statusCancelled);	//Cuando se llame desde el servicio se le pasará como parametro la fecha y hora actual y el estado de reserva cancelada

	@Query("select r from Route r where r.driver.id=?1 and r.departureDate>?2 and r.isCancelled = FALSE ")
	Collection<Route> findActiveRoutesByDriver(int driverId, Date now);	//Cuando se llame desde el servicio se le pasará como parametro la fecha y hora actual

	//	select b from Route b where (?1 is null or ?1='' or b.departureDate = ?1) and (?2 is null or ?2='' or b.origin like ?2)  and (?3 is null or ?3=''or b.destination like  ?3) and (?4 is null or b.vehicle.type =  ?4) and (?5 is null or b.availableSeats >= ?5) and (?6 is null or b.maxLugagge =  ?6) and (?7 is null or b.driver.pets = true) and (?8 is null or b.driver.childs = true) and (?9 is null or b.driver.smoke = true) and (?10 is null or b.driver.music = true)

	@Query("select b from Route b where (?1 is null) and (?2 is null)  and (?3 is null) and (?4 is null) and (?5 is null) and (?6 is null) and (b.driver.pets is ?7) and (b.driver.childs is ?8) and (b.driver.smoke is '%?9%') and (b.driver.music is ?10)")
	public Collection<Route> searchRoutes(LocalDateTime departureDate, String origin, String destination, VehicleType vehicleType, Integer avaiableSeats, LuggageSize maxLuggage, Boolean pets, Boolean childs, Boolean smoke, Boolean music);

}
