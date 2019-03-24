
package converters;

import javax.transaction.Transactional;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import domain.ControlPoint;

@Component
@Transactional
public class ControlPointToStringConverter implements Converter<ControlPoint, String> {

	@Override
	public String convert(final ControlPoint controlPoint) {
		String result;

		if (controlPoint == null)
			result = null;
		else
			result = String.valueOf(controlPoint.getId());
		return result;
	}
}
