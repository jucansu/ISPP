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
<form:form action="route/search.do" modelAttribute="finder">

	<div class="form-row" style="padding-top:50px;">

	<div>
	<form:label path="departureDate">
		<spring:message code="route.departureDate" /> (dd/MM/yyyy)
	</form:label>
	<form:input path="departureDate" readonly="${readonly}" />
	<form:errors path="departureDate" cssClass="error" />
	</div>
	
		<div class="form-group col-md-4">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="inputPassword4"> Departure time from:</label>
							<div class="input-group date" id="datetimepicker3"
								data-target-input="nearest">
								<form:input type="text" class="form-control datetimepicker-input" path="originTime"
									data-target="#datetimepicker3" />
								<div class="input-group-append" data-target="#datetimepicker3"
									data-toggle="datetimepicker">
									<div class="input-group-text">
										<i class="fa fa-clock-o"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						$(function() {
							$('#datetimepicker3').datetimepicker({
								format : 'LT'
							});
						});
					</script>
				</div>
			</div>
		</div>
		
		<div class="form-group col-md-4">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="inputPassword4"> Departure time to:</label>
							<div class="input-group date" id="datetimepicker32"
								data-target-input="nearest">
								<form:input type="text" class="form-control datetimepicker-input" path="destinationTime"
									data-target="#datetimepicker32" />
								<div class="input-group-append" data-target="#datetimepicker32"
									data-toggle="datetimepicker">
									<div class="input-group-text">
										<i class="fa fa-clock-o"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						$(function() {
							$('#datetimepicker32').datetimepicker({
								format : 'LT'
							});
						});
					</script>
				</div>
			</div>
		</div>

		<div class="form-group col-md-6">
			<label for="inputPassword4"> Origen:</label>
			<form:input code="location" path="origin" class="form-control"
				id="inputPassword4" />
		</div>
		
		
	

		<div class="form-group col-md-6">
			<label for="inputPassword4"> Destino:</label>
			<form:input code="location" path="destination" class="form-control"
				id="inputPassword4" />
		</div>
		<div class="form-group col-md-10">
			<label> Vehicle type:</label>
		
		<form:select path="vehicleType" class="form-control">
					<form:option label="Any" value="ANY" />
					<form:option label="Bike" value="BIKE" />
					<form:option label="Car" value="CAR" />
				</form:select>
		</div>
				


		<div class="form-group col-md-6">
			<label> Avaiable seats:</label>
			<form:input type="number" code="location" path="availableSeats"
				class="form-control" id="inputPassword4" />
		</div>

		<div class="form-group col-md-10">
			<label> Lugagge size:</label>
		<form:select path="luggageSize" class="form-control">
					<form:option label="Any" value="ANY" />
					<form:option label="Small" value="SMALL" />
					<form:option label="Medium" value="MEDIUM" />
					<form:option label="Big" value="BIG" />
		</form:select>
		</div>
		

		<div class="form-group col-md-3">
			<div class="form-check">
				<form:checkbox class="form-check-input"  value="true" path="pets"
					id="defaultCheck1"/> <label class="form-check-label"
					for="defaultCheck1"> Pets </label>
			</div>
		</div>

		<div class="form-group col-md-3">
			<div class="form-check">
				<form:checkbox class="form-check-input"  value="true" path="childs"
					id="defaultCheck1"/> <label class="form-check-label"
					for="defaultCheck1"> Childs </label>
			</div>
		</div>
		<div class="form-group col-md-3">
			<div class="form-check">
				<form:checkbox class="form-check-input"  value="true" path="smoke"
					id="defaultCheck1"/> <label class="form-check-label"
					for="defaultCheck1"> Smoke </label>
			</div>
		</div>
		<div class="form-group col-md-3">
			<div class="form-check">
				<form:checkbox class="form-check-input"  value="true" path="music"
					id="defaultCheck1"/> <label class="form-check-label"
					for="defaultCheck1"> Music </label>
			</div>
		</div>
	</div>



	<center>
		<div class="text-center">
			<input type="submit" name="search" class="btn btn-danger"
				value="Buscar!" />&nbsp;
		</div>
	</center>
</form:form>