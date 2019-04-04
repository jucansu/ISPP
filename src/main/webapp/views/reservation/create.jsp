<%--
 * action-1.jsp
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
	<h3>Make a reservation</h3>
</div>

<security:authorize access="hasRole('PASSENGER')">

<form:form action="reservation/passenger/create.do"	modelAttribute="reservation">
			<form:hidden path="id" />
			<form:hidden path="version" />
			<form:hidden path="passenger"/>
			<form:hidden path="route"/>
			<form:hidden path="driverPickedMe"/>
			<form:hidden path="driverNoPickedMe"/>
			<form:hidden path="status"/>
			<form:hidden path="price"/>


			<form:label path="seat">
				<spring:message code="route.request.seats" />: </form:label>
			<form:select path="seat" onclick="multiplicar()" id="seatId" class="form-control" required="true">
				<jstl:forEach var="x" begin="1" end="${remainingSeats}">
					<form:option label="${x}" value="${x}">
					</form:option>
				</jstl:forEach>
			</form:select>
			<form:errors cssClass="error" path="seat" />
			<br />



			<form:label path="origin">
				<spring:message code="route.origin" />: </form:label>
			<form:select path="origin" class="form-control" required="true">
				<form:option value="${route.origin }" />
			</form:select>
			<form:errors cssClass="error" path="origin" />
			<br />

			<form:label path="destination">
				<spring:message code="route.destination" />: </form:label>
			<form:select path="destination" class="form-control" required="true">
				<form:option value="${route.destination}" />
			</form:select>
			<form:errors cssClass="error" path="destination" />
			<br />

			<form:label path="luggageSize">
				<spring:message code="route.luggage" />: </form:label>
			<form:select path="luggageSize" class="form-control" required="true">
				<form:option value="NOTHING" label="NOTHING"/>
				<form:option value="SMALL" label="SMALL"/>
				<form:option value="MEDIUM" label="MEDIUM"/>
				<form:option value="BIG" label="BIG"/>
			</form:select>
			<form:errors cssClass="error" path="luggageSize" />
			<br />

			


			<center>
			<input type="submit" name="save" class="btn btn btn-success"
				value="<spring:message code="route.save" />" />
			<input type="button" name="cancel" class="btn btn-warning"
				value="<spring:message code="route.cancel" />"
				onclick="javascript: relativeRedir('route/display.do?routeId=${route.id}');" />
			<br />
			</center>

		</form:form>

		<script type="text/javascript">
			function multiplicar() {

				var result = document.getElementById("seatId").value * ${route.pricePerPassenger};
				document.getElementById("precioTotal").innerHTML = result.toFixed(2);
			};
		</script>

</security:authorize>