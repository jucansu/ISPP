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

<form:form id="form" action="${requestURI}" modelAttribute="passenger">
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	<form:hidden path="comments"/>
	<form:hidden path="reservations"/>
	<form:hidden path="cash"/>
	<form:hidden path="userAccount.id" />
	<form:hidden path="userAccount.enabled"/>
	<form:hidden path="userAccount.version" />
	<form:hidden path="userAccount.authorities" />
	
	

	<form:label path="name">
		<spring:message code="passenger.name"/>: 
	</form:label>
	<form:input path="name"/>
	<form:errors cssClass="error" path="name"/><br />
	
	<form:label path="surname">
		<spring:message code="passenger.surname"/>: 
	</form:label>
	<form:input path="surname"/>
	<form:errors cssClass="error" path="surname"/><br />
	
	<form:label path="country">
		<spring:message code="passenger.country"/>: 
	</form:label>
	<form:input path="country"/>
	<form:errors cssClass="error" path="country"/><br />
	
	<form:label path="city">
		<spring:message code="passenger.city"/>: 
	</form:label>
	<form:input path="city"/>
	<form:errors cssClass="error" path="city"/><br />
	
	<form:label path="phone">
		<spring:message code="passenger.phone"/>: 
	</form:label>
	<form:input id="phone" path="phone"/>
	<form:errors cssClass="error" path="phone"/><br />
	

	
	<form:label path="userAccount.username">
		<spring:message code="driver.username"/>: 
	</form:label>
	<form:input path="userAccount.username"/>
	<form:errors cssClass="error" path="userAccount.username"/><br />
	
	<form:label path="userAccount.password">
		<spring:message code="driver.password"/>: 
	</form:label>
	<form:password path="userAccount.password"/>
	<form:errors cssClass="error" path="userAccount.password"/><br />
	
	
	<form:label path="creditCard.number">
		<spring:message code="creditCard.number"/>: 
	</form:label>
	<form:input path="creditCard.number"/>
	<form:errors cssClass="error" path="creditCard.number"/><br />
	
	<form:label path="creditCard.expMonth">
		<spring:message code="creditCard.expMonth"/>: 
	</form:label>
	<form:input path="creditCard.expMonth"/>
	<form:errors cssClass="error" path="creditCard.expMonth"/><br />
	
	<form:label path="creditCard.expYear">
		<spring:message code="creditCard.expYear"/>: 
	</form:label>
	<form:input path="creditCard.expYear"/>
	<form:errors cssClass="error" path="creditCard.expYear"/><br />
	
	<form:label path="creditCard.cvv">
		<spring:message code="creditCard.cvv"/>: 
	</form:label>
	<form:input path="creditCard.cvv"/>
	<form:errors cssClass="error" path="creditCard.cvv"/><br />
	
	<form:label path="bankAccountNumber">
		<spring:message code="passenger.bankAccountNumber"/>: 
	</form:label>
	<form:input path="bankAccountNumber"/>
	<form:errors cssClass="error" path="bankAccountNumber"/><br />
	

	<input type="submit" name="save" value="<spring:message code="passenger.register"/>" />
	
	<input type="button" name="cancel"
		value="<spring:message code="passenger.cancel" />"
		onclick="javascript: relativeRedir('security/login.do');" />		
	
</form:form>



