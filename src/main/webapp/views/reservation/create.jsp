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

<security:authorize access="hasRole('PASSENGER')">
<form:form action= "reservation/passenger/create.do" modelAttribute="reservation">
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	
	
	<form:label path="seat"><spring:message code="reservation.seat"/>: </form:label>
	<form:select path="seat">
		<jstl:forEach var="x" begin="1" end="${remainingSeats}">
			<form:option 
			label="${x}" 
			value="${x}">
			</form:option>
		</jstl:forEach>
	</form:select>
	<form:errors cssClass="error" path="seat"/>
	<br/>
	
	<form:label path="origin"><spring:message code="reservation.origin"/>: </form:label>
	<form:select path="origin">
		<form:option 
		label="---" 
		value="0">
		</form:option>
		<form:options 
		items="${places}"
		itemValue="id"/>
	</form:select>
	<form:errors cssClass="error" path="origin"/>
	<br/>
	
	<form:label path="destination"><spring:message code="reservation.destination"/>: </form:label>
	<form:select path="destination">
		<form:option 
		label="---" 
		value="0">
		</form:option>
		<form:options 
		items="${places}"
		itemValue="id"/>
	</form:select>
	<form:errors cssClass="error" path="destination"/>
	<br/>
	
	<form:label path="luggage"><spring:message code="reservation.luggage"/>: </form:label>
	<form:select path="luggage">
		<form:option 
		label="---" 
		value="0">
		</form:option>
		<form:options 
		items="${luggageSizes}"
		itemValue="id"/>
	</form:select>
	<form:errors cssClass="error" path="luggage"/>
	<br/>
	
	<form:label path="price">
		<spring:message code="reservation.price"/>: 
	</form:label>
	<jstl:out value="${route.price}"></jstl:out>		<!-- TODO: esto del precio de momento asi pero habra que mejorarlo, creo -->
	<br/>
	
	
	<input type="submit" name="save"
		value="<spring:message code="reservation.save" />" /> 
	<input type="button" name="cancel"
		value="<spring:message code="reservation.cancel" />"
		onclick="javascript: relativeRedir('welcome/index.do');" />	<!-- TODO: aun por ver donde se redirigira -->
	<br />

</form:form>
</security:authorize>