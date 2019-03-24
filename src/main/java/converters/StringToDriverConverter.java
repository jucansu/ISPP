
package converters;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import repositories.DriverRepository;
import domain.Driver;

@Component
@Transactional
public class StringToDriverConverter implements Converter<String, Driver> {

	@Autowired
	private DriverRepository	driverRepository;


	@Override
	public Driver convert(final String text) {
		Driver result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.driverRepository.findOne(id);
			}
		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}
		return result;
	}

}
