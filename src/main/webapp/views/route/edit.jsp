<%--
 * action-1.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
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

<security:authorize access="hasRole('DRIVER')">
<form:form action= "${requestURI}" modelAttribute="route">
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	<form:hidden path="pricePerPassenger"/>
	<form:hidden path="distance"/>
	<form:hidden path="controlPoints"/>
	<form:hidden path="reserves"/>
	<form:hidden path="driver"/>
	
	<form:label path="departureDate">
		<spring:message code="route.departureDate"/>
	</form:label>
	<form:input path="departureDate"/>
	<form:errors cssClass="error" path="departureDate"/>
	<br/>
	
	<form:label path="origin">
		<spring:message code="route.origin"/>
	</form:label>
	<form:input path="origin"/>
	<form:errors cssClass="error" path="origin"/>
	<br/>
	
	<form:label path="destination">
		<spring:message code="route.destination"/>
	</form:label>
	<form:input path="destination"/>
	<form:errors cssClass="error" path="destination"/>
	<br/>
	
	<form:label path="estimatedDuration">
		<spring:message code="route.stimatedDuration"/>
	</form:label>
	<form:input path="estimatedDuration"/>
	<form:errors cssClass="error" path="estimatedDuration"/>
	<br/>
	
	<form:label path="daysRepeat">
		<spring:message code="route.daysRepeat"/>
	</form:label>
	<form:input path="daysRepeat"/>
	<form:errors cssClass="error" path="daysRepeat"/>
	<br/>
	
	<form:label path="availableSeats">
		<spring:message code="route.availableSeats"/>
	</form:label>
	<form:input path="availableSeats"/>
	<form:errors cssClass="error" path="availableSeats"/>
	<br/>
	
	<form:label path="details">
		<spring:message code="route.details"/>
	</form:label>
	<form:input path="details"/>
	<form:errors cssClass="error" path="details"/>
	<br/>
	
	<form:label path="isCancelled">
		<spring:message code="route.isCancelled"/>
	</form:label>
	<form:input path="isCancelled"/>
	<form:errors cssClass="error" path="isCancelled"/>
	<br/>
	
	<form:label path="maxLuggage">
		<spring:message code="route.maxLuggage"/>
	</form:label>
	<form:input path="maxLuggage"/>
	<form:errors cssClass="error" path="maxLuggage"/>
	<br/>
	
	<form:label path="vehicle">
	<spring:message code="route.vehicle"/>
	</form:label>
	<form:select path="vehicle">
		<form:option
			label="-------"
			value="0">
		</form:option>
		<form:options
			items="${vehicles}"
			itemLabel="model"
			itemValue="id" />
	</form:select>
	<form:errors cssClass="error" path="vehicle"/>
	<br/>
	
	<input type="submit" name="save"
		value="<spring:message code="route.save" />" /> 
	<jstl:if test="${route.id!=0}"> 
		<input type="submit" name="Abort Route" value="<spring:message code="route.abort" />"/>
	</jstl:if>
	<input type="button" name="cancel"
		value="<spring:message code="route.cancel" />"
		onclick="javascript: relativeRedir('route/list.do');" />
	<br />
	
	

</form:form>
</security:authorize>