
package converters;

import javax.transaction.Transactional;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import domain.Driver;

@Component
@Transactional
public class DriverToStringConverter implements Converter<Driver, String> {

	@Override
	public String convert(final Driver driver) {
		String result;

		if (driver == null)
			result = null;
		else
			result = String.valueOf(driver.getId());
		return result;
	}
}
