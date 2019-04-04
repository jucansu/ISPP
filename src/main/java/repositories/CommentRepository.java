
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {

	@Query("select c from Comment c where c.fromDriver = false and c.passenger.id = ?1")
	Collection<Comment> findCommentsByPassenger(int passengerId);

	@Query("select c from Comment c where c.fromDriver = true and c.driver.id = ?1")
	Collection<Comment> findCommentsByDriver(int driverId);

}
