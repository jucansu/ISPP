<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<spring:url value="/styles/route.css" var="routecss" />
<link href="${routecss}" rel="stylesheet" />
<script src="${routecss}"></script>
<link rel="stylesheet" href="/path/to/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
<div class="text-center active-routes">
	<h3>Create route</h3>
</div>


<spring:message code="route.cancel"  var="cancel"/>
<security:authorize access="hasRole('DRIVER')">
<center>
		<form:form action="${requestURI}" modelAttribute="route">
			<form:hidden path="id" />
			<form:hidden path="pricePerPassenger" />
			<form:hidden path="distance" />
			
			Departure:
			<form:input type="text" path="departureDate" />
			<form:errors path="departureDate" cssClass="error" />
			<br />
			Origin:
			<form:input type="text" path="origin.location" />
			<form:errors path="origin.location" cssClass="error" />
			<form:hidden path="origin.estimatedTime" />
			<form:hidden path="origin.arrivalOrder" />
			<form:hidden path="origin.distance" />
			<br />
			
			<jstl:forEach items="${route.controlpoints}" var="cp" varStatus="status">
				Stop:
				<form:input type="text" path="controlpoints[${status.index}].location" />
				<form:errors path="controlpoints[${status.index}].location" cssClass="error" />
				<form:input type="number" path="controlpoints[${status.index}].estimatedTime" />
				<form:errors path="controlpoints[${status.index}].estimatedTime" cssClass="error" />
				<form:hidden path="controlpoints[${status.index}].arrivalOrder" />
				<form:hidden path="controlpoints[${status.index}].distance" />
				<button type="submit" name="remove_cp" formaction="controlpoint/driver/remove.do?index=${status.index}">
					Remove
				</button>
				<br />
			</jstl:forEach>
			
			Destination:
			<form:input type="text" path="destination.location" />
			<form:errors path="destination.location" cssClass="error" />
			<form:input type="number" path="destination.estimatedTime" />
			<form:errors path="destination.estimatedTime" cssClass="error" />
			<form:hidden path="destination.arrivalOrder" />
			<form:hidden path="destination.distance" />
			<br />
			<button type="submit" name="add_cp" formaction="controlpoint/driver/add.do">
				Add stop
			</button>
			<br />
			Select vehicle:
			<form:select path="vehicle">
				<form:option label="-------" value="0">
				</form:option>
				<form:options items="${vehicles}" itemLabel="model" itemValue="id" />
			</form:select>
			<form:errors path="vehicle" cssClass="error" />
			<br />
			Available seats:
			<form:input type="number" path="availableSeats" />
			<form:errors path="availableSeats" cssClass="error" />
			<br />
			Max luggage size:
			<form:select path="maxLuggage" class="form-control">
				<form:option label="None" value="NOTHING" />
				<form:option label="Small" value="SMALL" />
				<form:option label="Medium" value="MEDIUM" />
				<form:option label="Big" value="BIG" />
			</form:select>
			<form:errors path="maxLuggage" cssClass="error" />
			<br />
			Details:
			<form:textarea path="details" />
			<br />
			
			<input type="submit" class="btn btn-success" value="<spring:message code="route.save" />" />
			<br />
		</form:form>
		
		<spring:message code="route.cancel"  var="cancel"/>
		<a href="route/driver/listActive.do" class="btn btn-danger" ><jstl:out value="${cancel}" /></a>
	</center>
</security:authorize>