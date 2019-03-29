
package converters;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import repositories.PassengerRepository;
import domain.Passenger;

@Component
@Transactional
public class StringToPassengerConverter implements Converter<String, Passenger> {

	@Autowired
	private PassengerRepository	passengerRepository;


	@Override
	public Passenger convert(final String text) {
		Passenger result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.passengerRepository.findOne(id);
			}
		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}
		return result;
	}

}
