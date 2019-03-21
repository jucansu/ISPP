
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Administrator;
import domain.Letter;

@Repository
public interface LetterRepository extends JpaRepository<Letter, Integer> {

}
