
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.ControlPoint;

@Repository
public interface ControlPointRepository extends JpaRepository<ControlPoint, Integer> {

}
