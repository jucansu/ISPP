<%--
 * display.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
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
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- Stored message variables --%>

<spring:message code="route.price"  var="msgPrice"/>
<spring:message code="route.distance"  var="msgDistance"/>
<spring:message code="route.confirm"  var="confirm"/>
<spring:message code="route.cancel"  var="cancel"/>
<spring:message code="route.confirm" var="msgConfirm" />



	<jstl:out value="${msgPrice}" />:
	<jstl:out value="${route.pricePerPassenger}" />
	<br />
	
	<jstl:out value="${msgDistance}" />:
	<jstl:out value="${route.distance}"/>
	<br />
	
	
<a href="route/list.do"><jstl:out value="${confirm}" /></a>
		
<spring:url var="deleteUrl" value="route/driver/delete.do">
			<spring:param name="routeId" value="${route.id}" />
		</spring:url>
		<a href="${deleteUrl}" onclick="return confirm('${msgConfirm}')" ><jstl:out value="${cancel}" /></a>

