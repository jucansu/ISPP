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

		<div class="form-group col-md-4" >
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="inputPassword4"> Departure date:</label>
							<div class="input-group date" id="datetimepicker4"
								data-target-input="nearest">
								<input type="text" class="form-control datetimepicker-input"
									data-target="#datetimepicker4" />
								<div class="input-group-append" data-target="#datetimepicker4"
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
							$('#datetimepicker4').datetimepicker({
								format : 'L'
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
							<label for="inputPassword4"> Departure time:</label>
							<div class="input-group date" id="datetimepicker3"
								data-target-input="nearest">
								<input type="text" class="form-control datetimepicker-input"
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
							<label for="inputPassword4"> Arrival time:</label>
							<div class="input-group date" id="datetimepicker3"
								data-target-input="nearest">
								<input type="text" class="form-control datetimepicker-input"
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
		</div>
		<div class="form-group col-md-3">
			<div class="radio">
				<label><input type="radio" name="vehicleType" checked>Any</label>
			</div>
		</div>
		<div class="form-group col-md-3">

			<div class="radio">
				<label><input type="radio" name="vehicleType">Car</label>
			</div>
		</div>
		<div class="form-group col-md-3">

			<div class="radio">
				<label><input type="radio" name="vehicleType">Bike</label>
			</div>
		</div>


		<div class="form-group col-md-6">
			<label> Avaiable seats:</label>
			<form:input type="number" code="location" path="availableSeats"
				class="form-control" id="inputPassword4" />
		</div>

		<div class="form-group col-md-10">
			<label> Lugagge size:</label>
		</div>
		<div class="form-group col-md-3">
			<div class="radio">
				<label><input type="radio" name="luggageSize" checked>Any</label>
			</div>
		</div>
		<div class="form-group col-md-3">

			<div class="radio">
				<label><input type="radio" name="luggageSize">Small</label>
			</div>
		</div>
		<div class="form-group col-md-3">

			<div class="radio">
				<label><input type="radio" name="luggageSize">Medium</label>
			</div>
		</div>

		<div class="form-group col-md-3">

			<div class="radio">
				<label><input type="radio" name="luggageSize">Big</label>
			</div>
		</div>

		<div class="form-group col-md-3">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="pets"
					id="defaultCheck1"> <label class="form-check-label"
					for="defaultCheck1"> Pets </label>
			</div>
		</div>

		<div class="form-group col-md-3">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="childs"
					id="defaultCheck1"> <label class="form-check-label"
					for="defaultCheck1"> Childs </label>
			</div>
		</div>
		<div class="form-group col-md-3">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="smoke"
					id="defaultCheck1"> <label class="form-check-label"
					for="defaultCheck1"> Smoke </label>
			</div>
		</div>
		<div class="form-group col-md-3">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="Music"
					id="defaultCheck1"> <label class="form-check-label"
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