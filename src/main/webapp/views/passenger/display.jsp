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
<!-- Nueva libreria fn para obtener la funcion length() para poder obtener el tama�o de una coleccion -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- Stored message variables --%>

<spring:message code="comment.text" var="vehText" />
<spring:message code="comment.date" var="vehDate" />
<spring:message code="comment.star" var="vehStar" />


<spring:message code="route.formatDate" var="formatDate" />
<spring:url value="/styles/profile.css" var="profilecss" />
<link href="${profilecss}" rel="stylesheet" />
<script src="${profilecss}"></script>

<div
	class="resume d-flex flex-column justify-content-center align-items-center">

	<img src="images/iconotronf.png" />

</div>

<div
	class="resume d-flex flex-column justify-content-center align-items-center">
	<dd>
	<dt>
		<jstl:out value="${passengerName}" />
		<jstl:out value="${passenger.name}" />
	</dd>
	</dt>

	<dd>
	<dt>
		<jstl:out value="${passengerSurname}" />
		<jstl:out value="${passenger.surname}" />
	</dd>
	</dr>


	<spring:message code="passenger.country" var="driverCountry" />
	<dt>
		<jstl:out value="${passengerCountry}" />
	</dt>
	<dd>
		<jstl:out value="${passenger.country}" />
	</dd>

	<spring:message code="passenger.phone" var="driverPhone" />
	<dt>
		<jstl:out value="${passengerPhone}" />
	</dt>
	<dd>
		<jstl:out value="${passenger.phone}" />
	</dd>

	<spring:message code="passenger.city" var="passengerCity" />
	<dt>
		<jstl:out value="${passengerCity}" />
	</dt>
	<dd>
		<jstl:out value="${passenger.city}" />
	</dd>
</div>

<div class="card_">
	<div class="card-header_" id="headingTwo">
		<h2 class="mb-0">
			<button class="btn btn-link collapsed" data-toggle="collapse"
				data-target="#collapseTwo" aria-expanded="false"
				aria-controls="collapseTwo">Comments</button>
		</h2>
	</div>
</div>


<!-- Comments -->

<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
	data-parent="#accordion">
	<div class="card-body d-flex flex-column">

		<div
			class="comments d-flex flex-row align-items-baseline justify-content-center m-2">
			<div class="comments">

				<jstl:forEach var="comment" items="${comments}">
					<div class="title listRoute"></div>
					<div class="comment d-flex flex-column align-items-center">

						<div class="comment.driver">
							<dd>
							<dt>
								<jstl:out value="${comment.driver.name }"></jstl:out>
								<jstl:out value="${comment.driver.surname }"></jstl:out>
							</dt>
							</dd>
						</div>


						<div class="date-comment">

							<fmt:formatDate value="${comment.date}" pattern="${formatDate}" />
						</div>

						<div class="comment.star">
							<jstl:out value="${comment.star }"></jstl:out>
						</div>

						<div class="comment.text">
							<jstl:out value="${comment.text }"></jstl:out>
						</div>


					</div>

				</jstl:forEach>

			</div>
		</div>


	</div>

</div>

<div class="endList">
	<div class="circle background_pink"></div>
	<div class="circle background_blue"></div>
	<div class="circle background_green"></div>
</div>
