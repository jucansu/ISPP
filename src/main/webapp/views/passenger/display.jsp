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

<dl>
	<spring:message code="passenger.name" var="passengerName"/>
	<dt><jstl:out value="${passengerName}"/></dt>
	<dd><jstl:out value="${passenger.name}"/></dd>
	
	<spring:message code="passenger.surname" var="driverSurname"/>
	<dt ><jstl:out value="${passengerSurname}"/></dt>
	<dd><jstl:out value="${passenger.surname}"/></dd>
	
	<spring:message code="passenger.country" var="driverCountry"/>
	<dt><jstl:out value="${passengerCountry}"/></dt>
	<dd><jstl:out value="${passenger.country}"/></dd>
	
	<spring:message code="passenger.phone" var="driverPhone"/>
	<dt><jstl:out value="${passengerPhone}"/></dt>
	<dd><jstl:out value="${passenger.phone}"/></dd>
	
	<spring:message code="passenger.city" var="passengerCity"/>
	<dt><jstl:out value="${passengerCity}"/></dt>
	<dd><jstl:out value="${passenger.city}"/></dd>
	
	<spring:message code="passenger.comment" var="passengerComments"/>
	<dt><jstl:out value="${passengerComments}"/></dt>
	<dd><jstl:out value="${passenger.comments}"/></dd>


</dl>