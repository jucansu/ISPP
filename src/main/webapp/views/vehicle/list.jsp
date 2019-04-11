<%--
 * display.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<%-- Stored message variables --%>

<spring:message code="vehicle.model" var="vehModel" />
<spring:message code="vehicle.brand" var="vehBrand" />
<spring:message code="vehicle.plate" var="vehPlate" />
<spring:message code="vehicle.description" var="vehDescription" />
<spring:message code="vehicle.capacity" var="vehCapacity" />
<spring:message code="vehicle.type" var="vehType" />
<spring:message code="vehicle.car" var="vehCar" />
<spring:message code="vehicle.bike" var="vehBike" />
<spring:message code="vehicle.edit.photo" var="vehEditPhoto" />
<spring:message code="vehicle.cancel" var="vehCancel" />


<link rel="stylesheet"
	href="/path/to/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />

<security:authorize access="hasRole('DRIVER')">
	<div>
		<jstl:if test="${principal.id eq driverId }">
			<spring:message code="vehicle.new" var="vehNew" />
			<center>
				<a href="vehicle/driver/create.do"
					class="btn btn-success btn-square btn-xl"><i
					class="fas fa-plus fa-2x"></i></a> <a href="vehicle/driver/create.do"><jstl:out
						value="${vehNew}" /></a>
			</center>
		</jstl:if>
	</div>

</security:authorize>

<spring:url value="/styles/route.css" var="routecss" />
<link href="${routecss}" rel="stylesheet" />
<script src="${routecss}"></script>

<div class="text-center active-routes">
	<!-- <h3>Vehicle list</h3> -->
</div>
<ul class="list-group">
	<jstl:forEach var="vehicle" items="${vehicles}">

		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
					
						<img src="${vehicle.image}" width="200" height="150">
						<div class="caption">
							<h3>${vehicle.vehicleBrand} ${vehicle.model}</h3>
							<p>${vehicle.description}</p>

						
								<div class="media-body pl-3">
									<div class="plate">
										<span>CAR PLATE :&ensp;</span>${vehicle.plate}
									</div>
									
									<div class="capacity">
										${vehicle.seatsCapacity}<span>&ensp;Seats capacity</span>
									</div>
									<div class="description">${vehicle.description}</div>
								</div> <spring:message code="vehicle.edit" var="editVehicle" /> <jstl:if
									test="${principal.id eq driverId }">
									<div class="font-weight-bold">
										<dd>
											<%-- <a class="text-danger"
												href="vehicle/driver/edit.do?vehicleId=${vehicle.id}"><jstl:out
													value="${editVehicle}" /></a> --%>
										</dd>

									</div>
								</jstl:if>
							<p>
								<a href="vehicle/driver/edit.do?vehicleId=${vehicle.id}" class="btn btn-success" role="button">Editar</a> <a
									href="#" class="btn btn-default" role="button">Eliminar</a>
							</p>
						</div>
					</div>
				</div>
				</div>
				</div>
	</jstl:forEach>
</ul>
