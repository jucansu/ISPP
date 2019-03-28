
package converters;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import repositories.ControlPointRepository;
import domain.ControlPoint;

@Component
@Transactional
public class StringToControlPointConverter implements Converter<String, ControlPoint> {

	@Autowired
	private ControlPointRepository	controlRepository;


	@Override
	public ControlPoint convert(final String text) {
		ControlPoint result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.controlRepository.findOne(id);
			}
		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}
		return result;
	}

}
