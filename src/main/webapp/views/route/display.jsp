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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<dl>
	<dt>
		<jstl:out value="${route.origin} ------> ${route.destination}" />
	</dt>
	<dd>
		<jstl:out value="${route.departureDate}" />
	</dd>


	<!-- RUTA (CON PARADAS) -->
	<jstl:out
		value="______________________________________________________________________________________" />
	<spring:message code="route.route" var="routeRoute" />
	<dt>
		<jstl:out value="${routeRoute}" />
	</dt>
	<jstl:out
		value="______________________________________________________________________________________" />
	<dl>
		<!-- ORIGEN -->
		<dd>
			<jstl:out value="(${route.departureDate}) ${route.origin}" />
		</dd>
		<dd>
			<jstl:out value="V" />
		</dd>
		<!-- PARADAS -->
		<jstl:if test="${fn:length(route.controlPoints)>0}">
			<jstl:forEach items="${route.controlPoints}" var="cp">
				<dd>
					<jstl:out value="(${cp.arrivalTime}) ${cp.location}" />
				</dd>
				<dd>
					<jstl:out value="V" />
				</dd>
			</jstl:forEach>
		</jstl:if>
		<!-- DESTINO -->
		<dd>
			<jstl:out value="(${arrivalDate}) ${route.destination}" />
		</dd>
	</dl>

	<!-- DETALLES -->

	<jstl:out
		value="______________________________________________________________________________________" />
	<spring:message code="route.details" var="routeDetails" />
	<dt>
		<jstl:out value="${routeDetails}" />
	</dt>
	<jstl:out
		value="______________________________________________________________________________________" />
	<!-- CONDUCTOR -->
	<spring:message code="route.driver" var="routeDriver" />
	<dt>
		<jstl:out value="${routeDriver}: " />
	</dt>
	<dd>
		<jstl:out value="${route.driver.name} ${route.driver.surname}" />
	</dd>
	<dd>
		<jstl:out value="${route.driver.mediumStars }/5" />
	</dd>
	<!-- VEHICULO -->
	<spring:message code="route.vehicle" var="routeVehicle" />
	<spring:message code="route.vehicle.type" var="routeVType" />
	<spring:message code="route.vehicle.model" var="routeVModel" />
	<spring:message code="route.vehicle.brand" var="routeVBrand" />
	<spring:message code="route.vehicle.description" var="routeVDesc" />

	<dt>
		<jstl:out value="${routeVehicle}: " />
	</dt>
	<dd>
		<img src="${route.vehicle.image}" width="150" />
	</dd>
	<dd>
		<jstl:out value="${routeVType}: ${route.vehicle.type}" />
	</dd>
	<dd>
		<jstl:out value="${routeVBrand}: ${route.vehicle.vehicleBrand}" />
	</dd>
	<dd>
		<jstl:out value="${routeVModel}: ${route.vehicle.model}" />
	</dd>
	<dd>
		<jstl:out value="${routeVDesc}: ${route.vehicle.description}" />
	</dd>
	<!-- PREFERENCIAS -->
	<spring:message code="route.preferences" var="routePref" />
	<spring:message code="route.pets" var="routePets" />
	<spring:message code="route.smoke" var="routeSmoke" />
	<spring:message code="route.children" var="routeChildren" />
	<spring:message code="route.music" var="routeMusic" />
	<dt>
		<jstl:out value="${routePref}: " />
	</dt>
	<form:form action="route/display.do" modelAttribute="route">

		<jstl:if test="${route.driver.pets == true}">
			<jstl:out value="${routePets}: " />
			<input type="checkbox" disabled="disabled" checked="checked">
		</jstl:if>

		<jstl:if test="${route.driver.pets == false}">
			<jstl:out value="${routePets}: " />
			<input type="checkbox" disabled="disabled">
		</jstl:if>

		<jstl:if test="${route.driver.childs == true}">
			<jstl:out value="${routeChildren}: " />
			<input type="checkbox" disabled="disabled" checked="checked">
		</jstl:if>

		<jstl:if test="${route.driver.childs == false}">
			<jstl:out value="${routeChildren}: " />
			<input type="checkbox" disabled="disabled">
		</jstl:if>
		</br>

		<jstl:if test="${route.driver.smoke == true}">
			<jstl:out value="${routeSmoke}: " />
			<input type="checkbox" disabled="disabled" checked="checked">
		</jstl:if>

		<jstl:if test="${route.driver.smoke == false}">
			<jstl:out value="${routeSmoke}: " />
			<input type="checkbox" disabled="disabled">
		</jstl:if>

		<jstl:if test="${route.driver.music == true}">
			<jstl:out value="${routeMusic}: " />
			<input type="checkbox" disabled="disabled" checked="checked">
		</jstl:if>

		<jstl:if test="${route.driver.music == false}">
			<jstl:out value="${routeMusic}: " />
			<input type="checkbox" disabled="disabled">
		</jstl:if>
		</br>
	</form:form>
	<!-- TAMAÑO EQUIPAJE -->
	<spring:message code="route.maxLuggage" var="routeLuggage" />
	<b><jstl:out value="${routeLuggage}:" /></b>
	<jstl:out value="${route.maxLuggage}" />
	</br>
	<!-- DETALLES -->
	<spring:message code="route.details" var="routeDetails" />
	<dt>
		<jstl:out value="${routeDetails}:" />
	</dt>
	<dd>
		<jstl:out value="${route.details}" />
	</dd>

	<!-- ASIENTOS -->
	<jstl:out
		value="______________________________________________________________________________________" />
	<spring:message code="route.seats" var="routeSeats" />
	<dt>
		<jstl:out value="${routeSeats}" />
	</dt>
	<jstl:out
		value="______________________________________________________________________________________" />
	</br>
	<!-- ASIENTOS DISPONIBLES-->
	<spring:message code="route.availableSeats" var="routeAvailable" />
	<b><jstl:out value="${routeAvailable}: " /></b>
	<jstl:out value="${remainingSeats}/${route.availableSeats}" />
	</br>
	<!-- PRECIO-->
	<spring:message code="route.price.per.passenger" var="routePPP" />
	<b><jstl:out value="${routePPP}: " /></b>
	<jstl:out value="${route.pricePerPassenger}" />
	</br>
	<!-- PASAJEROS-->
	<spring:message code="route.passengers" var="routePassengers" />
	<dt>
		<jstl:out value="${routePassengers}: " />
	</dt>

	<jstl:if test="${not empty reservations}">
		<spring:message code="route.luggage" var="resLuggage" />
		<jstl:forEach items="${reservations}" var="res">
			<dd>
				<jstl:out value="----------------------------" />
			</dd>
			<dd>
				<jstl:out value="${res.passenger.name} ${res.passenger.surname}" />
			</dd>
			<dd>
				<jstl:out value="${res.passenger.mediumStars}/5" />
			</dd>
			<dd>
				<jstl:out value="${resLuggage}: ${res.luggageSize}" />
			</dd>
			<dd>
				<jstl:out value="${res.origin} -> ${res.destination}" />
			</dd>
			
					<!-- (COMO CONDUCTOR) PARA CADA PASAJERO, BOTONES DE ACEPTAR O RECHAZAR SOLICITUD -->
			<security:authorize access="hasRole('DRIVER')">
				<jstl:if test="${rol == 1}">
					<jstl:if test="${res.status eq 'PENDING' }">
						<spring:message code="route.reservation.accept"
							var="acceptReservation" />
						<a href="reservation/driver/acceptReservation.do?reservationId=${res.id}"><jstl:out
								value="${acceptReservation}" /></a> |
					</jstl:if>
					<jstl:if test="${!(res.status eq 'ACCEPTED') }">
					<spring:message code="route.reservation.reject"
						var="rejectReservation" />
					<a href="reservation/driver/rejectReservation.do?reservationId=${res.id}"><jstl:out
							value="${rejectReservation}" /></a>
					</jstl:if>
				</jstl:if>
			</security:authorize>

		</jstl:forEach>
		<dd>
			<jstl:out value="----------------------------" />
		</dd>
	</jstl:if>

	<!-- (COMO PASAJERO) MENSAJE DE ESTADO DE LA RESERVA -->

	<security:authorize access="hasRole('PASSENGER')">
		<jstl:if test="${rol == 2}">

			<jstl:if test="${reservation.status eq 'PENDING' }">
				<spring:message code="route.reserv.pending" var="rrp" />
				<spring:message code="route.reserv.cancel" var="reservCancel" />
				<dd>
					<jstl:out value="${rrp}" />
				</dd>
				<dd>
					<a
						href="reservation/passenger/cancel.do?reservationId=${reservation.id}"><jstl:out
							value="${reservCancel}" /></a>
				</dd>
				<a></a>
			</jstl:if>

			<jstl:if test="${reservation.status eq 'ACCEPTED' }">
				<spring:message code="route.reserv.accepted" var="rra" />
				<spring:message code="route.reserv.cancel" var="reservCancel" />
				<dd>
					<jstl:out value="${rra}" />
				</dd>

				<!-- (COMO PASAJERO)PARA RESERVA ACEPTADA POR EL CONDUCTOR, BOTONES DE "¿ME HA RECOGIDO EL CONDUCTOR O NO?" -->
				
					<!-- SI LA RUTA ESTÁ EMPEZADA...  -->
				<jstl:if test="${startedRoute == true }">
					<spring:message code="route.driver.pick.up" var="pickup" />
						<!--...Y SI EL SISTEMA AUN NO SABE SI LO HA RECOGIDO, SE MUESTRA EL BOTON DE "ME HA RECOGIDO"...-->
					<jstl:if test="${reservation.driverPickedMe eq false and reservation.driverNoPickedMe eq false and hasPassed20Minutes eq false}">
					<dd>
						<a href="reservation/passenger/driverPickUp.do?reservationId=${reservation.id}"><jstl:out value="${pickup}" /></a>
					</dd>
					</jstl:if>
						<!-- ...PERO SI EL SISTEMA YA SABE QUE HA RECOGIDO AL PASAJERO, SOLO SE MUESTRA EL MENSAJE DE "ME HA RECOGIDO"-->
					<jstl:if test="${(reservation.driverPickedMe eq true and reservation.driverNoPickedMe eq false) or hasPassed20Minutes eq true}">
					<dd>
						<jstl:out value="${pickup}" />
					</dd>
					</jstl:if>
					<!-- UNA VEZ HAN PASADO 10 MINUTOS DESDE LA HORA DE SALIDA... -->
					<jstl:if test="${hasPassed10Minutes == true }">
						<spring:message code="route.driver.no.pick.up" var="nopickup" />
							<!-- ...SI  EL SISTEMA AUN NO SABE SI LO HA RECOGIDO, SE MUESTRA EL BOTON DE "NO ME HA RECOGIDO"...-->
						<jstl:if test="${reservation.driverPickedMe eq false and reservation.driverNoPickedMe eq false and hasPassed20Minutes eq false}">
							<dd>
								<a href="reservation/passenger/driverNoPickUp.do?reservationId=${reservation.id}"><jstl:out value="${nopickup}" /></a>
							</dd>
						</jstl:if>
						<!-- ...PERO SI EL SISTEMA YA SABE QUE NO HA RECOGIDO AL PASAJERO, SOLO SE MUESTRA EL MENSAJE DE "NO ME HA RECOGIDO"-->
						<jstl:if test="${reservation.driverPickedMe eq false and reservation.driverNoPickedMe eq true and hasPassed20Minutes eq false}">
							<dd>
								<jstl:out value="${nopickup}" />
							</dd>
						</jstl:if>
						
					</jstl:if>

				</jstl:if>
			<!-- SI EL VIAJE NO HA EMPEZADO, EL PASAJERO PUEDE CANCELAR LA RESERVA -->
				<jstl:if test="${startedRoute == false }">
					<dd>
						<a href="reservation/passenger/cancel.do?reservationId=${reservation.id}"><jstl:out value="${reservCancel}" /></a>
					</dd>
				</jstl:if>

			</jstl:if>
		<!-- SI LA RESERVA HA SIDO DENEGADA, SE MUESTRA MENSAJE DE "SOLICITUD DENEGADA" -->
			<jstl:if test="${reservation.status eq 'REJECTED' }">
				<spring:message code="route.reserv.rejected" var="rrr" />
				<dd>
					<jstl:out value="${rrr}" />
				</dd>
			</jstl:if>
		<!-- SI LA RESERVA HA SIDO CANCELADA, SE MUESTRA MENSAJE DE "SOLICITUD CANCELADA" -->
			<jstl:if test="${reservation.status eq 'CANCELLED' }">
				<spring:message code="route.reserv.cancelled" var="rrc" />
				<dd>
					<jstl:out value="${rrc}" />
				</dd>

			</jstl:if>

		</jstl:if>
	</security:authorize>


</dl>

<!-- FORMULARIO PARA CREAR RESERVA -->

<security:authorize access="hasRole('PASSENGER')">

	<jstl:if test="${rol==3}">

<form:form action="reservation/passenger/create.do"	modelAttribute="newReservation">
			<form:hidden path="id" />
			<form:hidden path="version" />
			<form:hidden path="passenger"/>
			<form:hidden path="route"/>
			<form:hidden path="driverPickedMe"/>
			<form:hidden path="driverNoPickedMe"/>
			<form:hidden path="status"/>


			<form:label path="seat">
				<spring:message code="route.request.seats" />: </form:label>
			<form:select path="seat" onclick="multiplicar()" id="seatId">
				<jstl:forEach var="x" begin="1" end="${remainingSeats}">
					<form:option label="${x}" value="${x}">
					</form:option>
				</jstl:forEach>
			</form:select>
			<form:errors cssClass="error" path="seat" />
			<br />



			<form:label path="origin">
				<spring:message code="route.origin" />: </form:label>
			<form:select path="origin">
				<form:option value="${route.origin }" />
			</form:select>
			<form:errors cssClass="error" path="origin" />
			<br />

			<form:label path="destination">
				<spring:message code="route.destination" />: </form:label>
			<form:select path="destination">
				<form:option value="${route.destination}" />
			</form:select>
			<form:errors cssClass="error" path="destination" />
			<br />

			<form:label path="luggageSize">
				<spring:message code="route.luggage" />: </form:label>
			<form:select path="luggageSize">
				<form:option label="---" value="0">
				</form:option>
				<form:options items="${luggageSizes}" itemValue="id" />
			</form:select>
			<form:errors cssClass="error" path="luggageSize" />
			<br />

			<form:label path="price">
				<spring:message code="route.total" />: 
	</form:label>
			<p id="precioTotal"></p>
			<br />



			<input type="submit" name="save"
				value="<spring:message code="route.save" />" />
			<input type="button" name="cancel"
				value="<spring:message code="route.cancel" />"
				onclick="javascript: relativeRedir('route/passenger/listActive.do');" />
			<br />

		</form:form>

		<script type="text/javascript">
			function multiplicar() {

				var result = document.getElementById("seatId").value * ${route.pricePerPassenger};
				document.getElementById("precioTotal").innerHTML = result.toFixed(2);
			};
		</script>
	</jstl:if>
</security:authorize>

