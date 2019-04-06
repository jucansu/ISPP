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

<spring:message code="driver.vehicles" var="driverVehicles"/>
<a href="vehicle/list.do?driverId=${driver.id}"><jstl:out value="${driverVehicles}"/></a></br>

<dl>
	<spring:message code="driver.name" var="driverName"/>
	<dt><jstl:out value="${driverName}"/></dt>
	<dd><jstl:out value="${driver.name}"/></dd>
	
	<spring:message code="driver.surname" var="driverSurname"/>
	<dt ><jstl:out value="${driverSurname}"/></dt>
	<dd><jstl:out value="${driver.surname}"/></dd>
	
	<spring:message code="driver.country" var="driverCountry"/>
	<dt><jstl:out value="${driverCountry}"/></dt>
	<dd><jstl:out value="${driver.country}"/></dd>
	
	<spring:message code="driver.phone" var="driverPhone"/>
	<dt><jstl:out value="${driverPhone}"/></dt>
	<dd><jstl:out value="${driver.phone}"/></dd>
	
	<spring:message code="driver.city" var="driverCity"/>
	<dt><jstl:out value="${driverCity}"/></dt>
	<dd><jstl:out value="${driver.city}"/></dd>
	
	<spring:message code="driver.comment" var="driverComments"/>
	<dt><jstl:out value="${driverComments}"/></dt>
	<dd><jstl:out value="${driver.comments}"/></dd>


</dl>