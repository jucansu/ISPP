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

<display:table name="routes" id="row" pagesize="4" class="displaytag"
	requestURI="${requestURI}">

	<spring:message code="route.distance" var="auMomentCreated" />
	<display:column property="distance" title="${auMomentCreated}"
		sortable="true" />

	<spring:message code="route.price" var="auTitle" />
	<display:column property="pricePerPassenger" title="${auTitle}"
		sortable="true" />

</display:table>


<security:authorize access="hasRole('DRIVER')">
	<a href="route/driver/create.do"> <spring:message
			code="route.create" /></a>
</security:authorize>