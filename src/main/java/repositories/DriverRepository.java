
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Administrator;
import domain.Driver;

@Repository
public interface DriverRepository extends JpaRepository<Driver, Integer> {

}
