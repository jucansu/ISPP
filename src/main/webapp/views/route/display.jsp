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
<!-- Nueva libreria fn para obtener la funcion length() para poder obtener el tamaño de una coleccion -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<dl>
	<dt><jstl:out value="${route.origin} ------> ${route.destination}" /></dt>
	<dd><jstl:out value="${route.departureDate}"/> </dd>
	
	
	<!-- RUTA (CON PARADAS) -->
	<jstl:out value="______________________________________________________________________________________"/>
	<spring:message code="route.route" var="routeRoute"/>
	<dt><jstl:out value="${routeRoute}" /></dt>
	<jstl:out value="______________________________________________________________________________________"/>
	<dl>
		<!-- ORIGEN -->
		<dd><jstl:out value="(${route.departureDate}) ${route.origin}"/></dd>
		<dd><jstl:out value="V"/></dd>
		<!-- PARADAS -->
		<jstl:if test="${fn:length(route.controlPoints)>0}">
			<jstl:forEach items="${route.controlPoints}" var="cp">
				<dd><jstl:out value="(${cp.arrivalTime}) ${cp.location}" /></dd>
				<dd><jstl:out value="V"/></dd>
			</jstl:forEach>
		</jstl:if>
		<!-- DESTINO -->
		<dd><jstl:out value="(${arrivalDate}) ${route.destination}"/></dd>
	</dl>
	
	<!-- DETALLES -->
	
	<jstl:out value="______________________________________________________________________________________"/>
	<spring:message code="route.details" var="routeDetails"/>
	<dt><jstl:out value="${routeDetails}" /></dt>
	<jstl:out value="______________________________________________________________________________________"/>
		<!-- CONDUCTOR -->
	<spring:message code="route.driver" var="routeDriver"/>
	<dt><jstl:out value="${routeDriver}: "/></dt>
	<dd><jstl:out value="${route.driver.name} ${route.driver.surname}"/></dd>
	<dd><jstl:out value="${route.driver.mediumStars }/5"/></dd>
		<!-- VEHICULO -->
	<spring:message code="route.vehicle" var="routeVehicle"/>
	<spring:message code="route.vehicle.type" var="routeVType"/>
	<spring:message code="route.vehicle.model" var="routeVModel"/>
	<spring:message code="route.vehicle.brand" var="routeVBrand"/>
	<spring:message code="route.vehicle.description" var="routeVDesc"/>

	<dt><jstl:out value="${routeVehicle}: "/></dt>
	<dd><img src="${route.vehicle.image}" width="150"/></dd>
	<dd><jstl:out value="${routeVType}: ${route.vehicle.type}"/></dd>
	<dd><jstl:out value="${routeVBrand}: ${route.vehicle.vehicleBrand}"/></dd>
	<dd><jstl:out value="${routeVModel}: ${route.vehicle.model}"/></dd>
	<dd><jstl:out value="${routeVDesc}: ${route.vehicle.description}"/></dd>
		<!-- PREFERENCIAS -->
	<spring:message code="route.preferences" var="routePref"/>
	<spring:message code="route.pets" var="routePets"/>
	<spring:message code="route.smoke" var="routeSmoke"/>
	<spring:message code="route.children" var="routeChildren"/>
	<spring:message code="route.music" var="routeMusic"/>
	<dt><jstl:out value="${routePref}: "/></dt>
	<form:form action="route/display.do" modelAttribute="route">
		
		<jstl:if test="${route.driver.pets == true}">
			<jstl:out value="${routePets}: "/><input type="checkbox"  disabled="disabled" checked="checked">
		</jstl:if>
		
		<jstl:if test="${route.driver.pets == false}">
			<jstl:out value="${routePets}: "/><input type="checkbox" disabled="disabled">
		</jstl:if>
		
		<jstl:if test="${route.driver.childs == true}">
			<jstl:out value="${routeChildren}: "/><input type="checkbox" disabled="disabled" checked="checked">
		</jstl:if>
		
		<jstl:if test="${route.driver.childs == false}">
			<jstl:out value="${routeChildren}: "/><input type="checkbox" disabled="disabled">
		</jstl:if>
		</br>
		
		<jstl:if test="${route.driver.smoke == true}">
			<jstl:out value="${routeSmoke}: "/><input type="checkbox" disabled="disabled" checked="checked">
		</jstl:if>
		
		<jstl:if test="${route.driver.smoke == false}">
			<jstl:out value="${routeSmoke}: "/><input type="checkbox" disabled="disabled">
		</jstl:if>
		
		<jstl:if test="${route.driver.music == true}">
			<jstl:out value="${routeMusic}: "/><input type="checkbox" disabled="disabled" checked="checked">
		</jstl:if>
		
		<jstl:if test="${route.driver.music == false}">
			<jstl:out value="${routeMusic}: "/><input type="checkbox" disabled="disabled">
		</jstl:if>
		</br>
	</form:form>
		<!-- TAMAÑO EQUIPAJE -->
	<spring:message code="route.maxLuggage" var="routeLuggage"/>
	<b><jstl:out value="${routeLuggage}:" /></b><jstl:out value="${route.maxLuggage}"/></br>
		<!-- DETALLES -->
	<spring:message code="route.details" var="routeDetails"/>
	<dt><jstl:out value="${routeDetails}:"/></dt>
	<dd><jstl:out value="${route.details}"/></dd>
	
	<!-- ASIENTOS -->
	<jstl:out value="______________________________________________________________________________________"/>
	<spring:message code="route.seats" var="routeSeats"/>
	<dt><jstl:out value="${routeSeats}" /></dt>
	<jstl:out value="______________________________________________________________________________________"/></br>
		<!-- ASIENTOS DISPONIBLES-->
	<spring:message code="route.availableSeats" var="routeAvailable"/>
	<b><jstl:out value="${routeAvailable}: "/></b> <jstl:out value="${remainingSeats}/${route.availableSeats}"/></br>
		<!-- PRECIO-->
	<spring:message code="route.price.per.passenger" var="routePPP"/>
	<b><jstl:out value="${routePPP}: "/></b><jstl:out value="${route.pricePerPassenger}"/></br>
		<!-- PASAJEROS-->
	<spring:message code="route.passengers" var="routePassengers"/>
	<dt><jstl:out value="${routePassengers}: "/></dt>
	
	<jstl:if test="${not empty reservations}">
		<spring:message code="route.luggage" var="resLuggage"/>
			<jstl:forEach items="${reservations}" var="res">
				<dd><jstl:out value="----------------------------"/></dd>
				<dd><jstl:out value="${res.passenger.name} ${res.passenger.surname}"/></dd>
				<dd><jstl:out value="${res.passenger.mediumStars}/5"/></dd>
				<dd><jstl:out value="${resLuggage}: ${res.luggageSize}"/></dd>
				<dd><jstl:out value="${res.origin} -> ${res.destination}"/></dd>

 			<security:authorize access="hasRole('DRIVER')">
				<jstl:if test="${rol == 1}">
					<jstl:if test="${res.status eq 'PENDING' }">
					<spring:message code="route.reservation.accept" var="acceptReservation"/>
						<a href="reservation/driver/accept.do?reservationId=${res.id}"><jstl:out value="${acceptReservation}"/></a> |
					</jstl:if>
					<spring:message code="route.reservation.reject" var="rejectReservation"/>
					<a href="reservation/driver/reject.do?reservationId=${res.id}"><jstl:out value="${rejectReservation}"/></a>	
				</jstl:if>
				</security:authorize> 
				
			</jstl:forEach>
			<dd><jstl:out value="----------------------------"/></dd>
	</jstl:if>
	
	<security:authorize access="hasRole('PASSENGER')">
		<jstl:if test="${rol == 2}">
			<jstl:if test="${reservation.status eq 'PENDING' }">
				<spring:message code="route.reserv.pending" var="rrp"/>
				<dd><jstl:out value="${rrp}"/></dd>
			</jstl:if>
			<jstl:if test="${reservation.status eq 'ACCEPTED' }">
				<spring:message code="route.reserv.accepted" var="rra"/>
				<dd><jstl:out value="${rra}"/></dd>
			</jstl:if>
			<jstl:if test="${reservation.status eq 'REJECTED' }">
				<spring:message code="route.reserv.rejected" var="rrr"/>
				<dd><jstl:out value="${rrr}"/></dd>
			</jstl:if>
			<jstl:if test="${reservation.status eq 'CANCELLED' }">
				<spring:message code="route.reserv.cancelled" var="rrc"/>
				<dd><jstl:out value="${rrc}"/></dd>
			</jstl:if>
		</jstl:if>
	</security:authorize>
	
	
</dl>

