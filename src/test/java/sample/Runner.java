
package sample;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.Test;

import domain.Car;

public class Runner {

	@SuppressWarnings("deprecation")
	@Test
	public void crud() {
		final SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
		final Session session = sessionFactory.openSession();

		this.create(session);
		this.read(session);

		this.update(session);
		this.read(session);

		this.delete(session);
		this.read(session);

		session.close();
	}

	private void delete(final Session session) {
		System.out.println("Deleting mondeo record...");
		final Car mondeo = (Car) session.get(Car.class, "mondeo");

		session.beginTransaction();
		session.delete(mondeo);
		session.getTransaction().commit();
	}

	private void update(final Session session) {
		System.out.println("Updating mustang price...");
		final Car mustang = (Car) session.get(Car.class, "mustang");
		mustang.setModel("mustang");
		mustang.setPrice(45000);

		session.beginTransaction();
		session.saveOrUpdate(mustang);
		session.getTransaction().commit();
	}

	private void create(final Session session) {
		System.out.println("Creating car records...");
		final Car mustang = new Car();
		mustang.setModel("mustang");
		mustang.setPrice(40000);

		final Car mondeo = new Car();
		mondeo.setModel("mondeo");
		mondeo.setPrice(20000);

		session.beginTransaction();
		session.save(mustang);
		session.save(mondeo);
		session.getTransaction().commit();
	}

	private void read(final Session session) {
		final Query q = session.createQuery("select _car from Car _car");

		final List<Car> cars = q.list();

		System.out.println("Reading car records...");
		System.out.printf("%-30.30s  %-30.30s%n", "Model", "Price");
		for (final Car c : cars)
			System.out.printf("%-30.30s  %-30.30s%n", c.getModel(), c.getPrice());
	}
}
