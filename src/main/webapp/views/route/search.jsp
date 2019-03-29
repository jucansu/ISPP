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
<div class="text-center active-routes">
	<h3>Search route</h3>
</div>
<form:form action="route/search.do" modelAttribute="finder">

	<div class="form-row" style="padding-top: 50px;">


		<div class="form-group col-md-6">
			<div class="form-group">
				<label for="inputPassword4"> Departure date:</label>
				<div class="input-group date" id="datetimepicker"
					data-target-input="nearest">
					<form:input path="departureDate" readonly="${readonly}"
						class="form-control datetimepicker-input"
						data-target="#datetimepicker1" />
					<div class="input-group-append" data-target="#datetimepicker"
						data-toggle="datetimepicker">
						<div class="input-group-text">
							<i class="fa fa-calendar"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				$('#datetimepicker').datetimepicker({
					format : 'DD/MM/YYYY',
					minDate : new Date()
				});
			});
		</script>
	</div>
	<div class="form-group col-md-3">
		<form:label path="originTime">
			<spring:message code="origin.time" />
		</form:label>
		<form:input path="originTime" readonly="${readonly}" pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]"
			class="form-control" placeholder="HH:MM" />
		<form:errors path="originTime" cssClass="error"  />
	
		<form:label path="destinationTime">
			<spring:message code="destination.time" />
		</form:label>
		<form:input path="destinationTime" readonly="${readonly}" pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]"
			class="form-control" placeholder="HH:MM" />
		<form:errors path="destinationTime" cssClass="error" />
	</div>

	<div class="form-group col-md-6">
		<label for="inputPassword4"> <spring:message code="route.origin" /> </label>
		<form:input code="location" path="origin" class="form-control"
			id="inputPassword4" required="false"/>
	</div>




	<div class="form-group col-md-6">
		<label for="inputPassword4"><spring:message code="route.destination" /></label>
		<form:input code="location" path="destination" class="form-control"
			id="inputPassword4" required="true"/>
	</div>
	<div class="form-group col-md-10">
		<label> <spring:message code="route.vehicleType" /></label>

		<form:select path="vehicleType" class="form-control">
			<form:option label="Any" value="0" />
			<form:option label="Car" value="1" />
			<form:option label="Bike" value="2" />
		</form:select>
	</div>



	<div class="form-group col-md-6">
		<label><spring:message code="route.availableSeats" /></label>
		<form:input type="number" code="location" path="availableSeats" min="1" max="9"
			class="form-control" id="inputPassword4" />
	</div>

	<div class="form-group col-md-10">
		<label> <spring:message code="route.maxLuggage" /></label>
		<form:select path="luggageSize" class="form-control">
			<form:option label="Nothing" value="NOTHING" />
			<form:option label="Small" value="SMALL" />
			<form:option label="Medium" value="MEDIUM" />
			<form:option label="Big" value="BIG" />
		</form:select>
	</div>


	<div class="form-group col-md-3">
		<div class="form-check">
			<form:checkbox class="form-check-input" value="true" path="pets"
				id="defaultCheck1" />
			<label class="form-check-label" for="defaultCheck1"> <spring:message code="route.pets" /> </label>
		</div>
	</div>

	<div class="form-group col-md-3">
		<div class="form-check">
			<form:checkbox class="form-check-input" value="true" path="childs"
				id="defaultCheck2" />
			<label class="form-check-label" for="defaultCheck2"> <spring:message code="route.childs" /> </label>
		</div>
	</div>
	<div class="form-group col-md-3">
		<div class="form-check">
			<form:checkbox class="form-check-input" value="true" path="smoke"
				id="defaultCheck3" />
			<label class="form-check-label" for="defaultCheck3"> <spring:message code="route.smoke" /> </label>
		</div>
	</div>
	<div class="form-group col-md-3">
		<div class="form-check">
			<form:checkbox class="form-check-input" value="true" path="music"
				id="defaultCheck4" />
			<label class="form-check-label" for="defaultCheck4"> <spring:message code="route.music" /> </label>
		</div>
	</div>




	<center>
		<div class="text-center">
			<input type="submit" name="search" class="btn btn-danger"
				value="Buscar!" />&nbsp;
		</div>
	</center>
</form:form>