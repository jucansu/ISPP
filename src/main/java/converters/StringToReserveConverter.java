
package converters;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import repositories.ReserveRepository;
import domain.Reserve;


@Component
@Transactional
public class StringToReserveConverter implements Converter<String, Reserve> {

	@Autowired
	private ReserveRepository	reserveRepository;


	@Override
	public Reserve convert(final String text) {
		Reserve result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.reserveRepository.findOne(id);
			}
		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}
		return result;
	}

}
