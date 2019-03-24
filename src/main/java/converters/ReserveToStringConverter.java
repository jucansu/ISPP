
package converters;

import javax.transaction.Transactional;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import domain.Reserve;
@Component
@Transactional
public class ReserveToStringConverter implements Converter<Reserve, String> {

	@Override
	public String convert(final Reserve reserve) {
		String result;

		if (reserve == null)
			result = null;
		else
			result = String.valueOf(reserve.getId());
		return result;
	}
}
