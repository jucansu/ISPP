<%--
 * action-1.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form id="form" action="${requestURI}" modelAttribute="driver">
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="routes" />
	<form:hidden path="vehicles" />
	<form:hidden path="cash" />
	<form:hidden path="userAccount.id" />
	<form:hidden path="userAccount.enabled" />
	<form:hidden path="userAccount.version" />
	<form:hidden path="userAccount.authorities" />



	<div
		class="resume d-flex flex-column justify-content-center align-items-center">

		<div class="form-row">
			<div class="col">

				<input type="text" class="form-control"
					placeholder=<spring:message code="driver.name"/>>
				<form:errors cssClass="error" path="name" />
				<br />
			</div>
		</div>
		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control"
					placeholder=<spring:message code="driver.surname"/>>
				<form:errors cssClass="error" path="surname" />
				<br />
			</div>
		</div>

		</br>

		<div class="form-row">
			<div class="col">

				<input type="text" class="form-control"
					placeholder=<spring:message code="driver.country"/>>
				<form:errors cssClass="error" path="country" />
				<br />
			</div>
		</div>
		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control"
					placeholder=<spring:message code="driver.city"/>>
				<form:errors cssClass="error" path="city" />
				<br />

			</div>

		</div>

		<div class="form-row">
			<div class="col">

				<input type="text" class="form-control"
					placeholder=<spring:message code="driver.phone"/>>
				<form:errors cssClass="error" path="phone" />
				<br />
			</div>

		</div>

		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control"
					placeholder=<spring:message code="driver.username"/>>
				<form:errors cssClass="error" path="userAccount.username" />
				<br />
			</div>
		</div>
		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control"
					placeholder=<spring:message code="userAccount.password"/>>
				<form:errors cssClass="error" path="userAccount.password" />
				<br />
			</div>
		</div>
		
		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control"
					placeholder=<spring:message code="creditCard.number"/>>
				<form:errors cssClass="error" path="creditCard.number" />
				<br />
			</div>
		</div>



		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control"
					placeholder=<spring:message code="creditCard.expMonth"/>>
				<form:errors cssClass="error" path="creditCard.expMonth" />
				<br />
			</div>
		</div>



		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control"
					placeholder=<spring:message code="creditCard.expYear"/>>
				<form:errors cssClass="error" path="creditCard.expYear" />
				<br />
			</div>
		</div>


		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control"
					placeholder=<spring:message code="creditCard.cvv"/>>
				<form:errors cssClass="error" path="creditCard.cvv" />
				<br />
			</div>
		</div>



		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control"
					placeholder=<spring:message code="driver.bankAccountNumber"/>>
				<form:errors cssClass="error" path="bankAccountNumber" />
				<br />
			</div>
		</div>

		<div class="form-row">
			<div class="col">
				<spring:message code="driver.preferences"/></br>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox"
						id="inlineCheckbox1" value="option1"> <label
						class="form-check-label" for="inlineCheckbox1">Childs</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox"
						id="inlineCheckbox2" value="option2"> <label
						class="form-check-label" for="inlineCheckbox2">Pets</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox"
						id="inlineCheckbox2" value="option3"> <label
						class="form-check-label" for="inlineCheckbox2">Smoking</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox"
						id="inlineCheckbox2" value="option4"> <label
						class="form-check-label" for="inlineCheckbox2">Music</label>
				</div>

			</div>
		</div>



		<input type="submit" class="btn btn-success" name="save"
			value="<spring:message code="driver.register"/>" /> <input
			type="button" class="btn btn-danger" name="cancel"
			value="<spring:message code="driver.cancel" />"
			onclick="javascript: relativeRedir('security/login.do');" />

	</div>



</form:form>




