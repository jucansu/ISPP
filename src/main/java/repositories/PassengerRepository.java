
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Administrator;
import domain.Passenger;

@Repository
public interface PassengerRepository extends JpaRepository<Passenger, Integer> {

}
