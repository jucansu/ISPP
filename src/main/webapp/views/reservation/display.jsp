<%--
 * action-2.jsp
 *
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<dl>

	<spring:message code="reservation.route" var="reservRoute"/>
	<dt><jstl:out value="${reservRoute}: " /></dt>
	<dd><a href="route/display.do?routeId=${reservation.route.id}"><jstl:out value="${reservation.route.origin} - ${reservation.route.destination}}"/> </a></dd>
	
	<spring:message code="reservation.origin" var="reservOrigin"/>
	<dt><jstl:out value="${reservOrigin}: " /></dt>
	<dd><jstl:out value="${reservation.origin}"/> </dd>
	
	<spring:message code="reservation.destination" var="reservDestination"/>
	<dt><jstl:out value="${reservDestination}" /></dt>
	<dd><jstl:out value="${reservation.description}"/> </dd>
	
	<spring:message code="reservation.seats" var="reservSeats"/>
	<dt><jstl:out value="${reservSeats}: " /></dt>
	<dd><jstl:out value="${reservation.seat}"/> </dd>
		
	<spring:message code="reservation.passenger" var="reservPassenger"/>
	<dt><jstl:out value="${reservPassenger}" /></dt>
	<dd><a href="passenger/display.do?passengerId=${reservation.passenger.id}"><jstl:out value="${reservation.passenger.name}"/></a></dd>
	
	
</dl>