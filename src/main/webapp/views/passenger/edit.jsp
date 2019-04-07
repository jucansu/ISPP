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
	<form:hidden path="bankAccountNumber"/>
	<form:hidden path="creditCard.cvv"/>
	<form:hidden path="creditCard.number"/>
	<form:hidden path="creditCard.expMonth"/>
	<form:hidden path="creditCard.expYear"/>
	<form:hidden path="cash"/>
	<form:hidden path="userAccount.id" />
	<form:hidden path="userAccount.enabled"/>
	<form:hidden path="userAccount.version" />
	<form:hidden path="userAccount.authorities" />
	<form:hidden path="userAccount.username" />
	<form:hidden path="userAccount.password" />
	
	

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
	
	

	<input type="submit" name="save" value="<spring:message code="passenger.register"/>" />
	
	<input type="button" name="cancel"
		value="<spring:message code="passenger.cancel" />"
		onclick="javascript: relativeRedir('security/login.do');" />		
	
</form:form>



