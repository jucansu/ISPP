
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Reservation;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {

	@Query("select r from Reservation r where r.passenger.id=?1")
	Collection<Reservation> findReservationsByPassenger(int passengerId);

	@Query("select r from Reservation r where r.route.id=?1")
	Collection<Reservation> findReservationsByRoute(int routeId);
}
