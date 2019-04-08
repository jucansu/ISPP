
package forms;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

public class CommentForm {

	public CommentForm() {
		super();
	}


	private String	text;
	private Double	star;


	@NotBlank
	public String getText() {
		return this.text;
	}

	@NotNull
	@Range(min = 0, max = 5)
	public Double getStar() {
		return this.star;
	}

}
