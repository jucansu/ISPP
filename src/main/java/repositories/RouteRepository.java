
package repositories;

import java.util.Collection;

import org.joda.time.LocalDateTime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.LuggageSize;
import domain.Route;
import domain.VehicleType;

@Repository
public interface RouteRepository extends JpaRepository<Route, Integer> {

	@Query("select b from Route b where (?1 is null or ?1=''or b.departureDate =  %?1%) and (?3 is null or ?3='' or b.origin like %?3%)  and (?4 is null or ?4=''or b.destination like  %?4%)and (?5 is null or b.vehicle.type =  %?5%) and (?6 is null or b.availableSeats >= ?6) and (?7 is null or b.maxLugagge =  %?7%) and (?8 is null or b.driver.pets = true) and (?9 is null or b.driver.childs = true) and (?10 is null or b.driver.smoke = true) and (?11 is null or b.driver.music = true)")
	public Collection<Route> finderSearch(LocalDateTime departureDate, String origin, String destination, VehicleType vehicleType, Integer aviableSeats, LuggageSize maxLuggage, Boolean pets, Boolean childs, Boolean smoke, Boolean music);

}
