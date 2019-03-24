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

<dl>
	<spring:message code="route.distance" var="audMoment"/>
	<dt><jstl:out value="${audMoment}" /></dt>
	<dd><jstl:out value="${route.distance}"/> </dd>
	
	<spring:message code="route.price" var="audTitle"/>
	<dt><jstl:out value="${audTitle}" /></dt>
	<dd><jstl:out value="${route.pricePerPassenger}"/> </dd>
	
	
	
</dl>

