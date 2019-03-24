
package repositories;

import java.util.Collection;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.ReservationStatus;
import domain.Route;

@Repository
public interface RouteRepository extends JpaRepository<Route, Integer> {

	@Query("select r from Route r join r.reservations res where res.passenger.id=?1 and r.departureDate>?2 and res.status != ?3 and r.isCancelled = FALSE")
	Collection<Route> findActiveRoutesByPassenger(int passengerId, Date now, ReservationStatus statusCancelled);	//Cuando se llame desde el servicio se le pasará como parametro la fecha y hora actual y el estado de reserva cancelada

	@Query("select r from Route r where r.driver.id=?1 and r.departureDate>?2 and r.isCancelled = FALSE ")
	Collection<Route> findActiveRoutesByDriver(int driverId, Date now);	//Cuando se llame desde el servicio se le pasará como parametro la fecha y hora actual
}
