
package converters;

import javax.transaction.Transactional;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import domain.Passenger;

@Component
@Transactional
public class PassengerToStringConverter implements Converter<Passenger, String> {

	@Override
	public String convert(final Passenger passenger) {
		String result;

		if (passenger == null)
			result = null;
		else
			result = String.valueOf(passenger.getId());
		return result;
	}
}
