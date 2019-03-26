
<%--

* login.jsp

*

* Copyright (C) 2019 Universidad de Sevilla

*

* The use of this project is hereby constrained to the conditions of the

* TDG Licence, a copy of which you may download from

* http://www.tdg-seville.info/License.html

--%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@taglib prefix="jstl"
	uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%@taglib prefix="display" uri="http://displaytag.sf.net"%><form:form
	action="j_spring_security_check" modelAttribute="credentials">

	<spring:url value="/styles/login.css" var="logincss" />
	<link href="${logincss}" rel="stylesheet" />
	<script src="${logincss}"></script>


	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<img src="images/logoicon.png" />
			</div>

			<!-- Login Form -->
			<form:form action="j_spring_security_check"
				modelAttribute="credentials">
				<form:input path="username" type="text" id="login"
					class="fadeIn second" name="login" placeholder="email" />
				<form:errors class="error" path="username" />
				<form:input path="password" type="password" id="password"
					class="fadeIn third" name="login" autocomplete="new-password"
					placeholder="password" />
				<form:errors class="error" path="password" />
				<input type="submit" class="fadeIn fourth" value="Entrar">

				<jstl:if test="${showError == true}">
					<div class="error">
						<spring:message code="security.login.failed" />
					</div>
				</jstl:if>
			</form:form>
			
			<ul id="formFooter">
				<li><a class="underlineHover" href="#">Create new account as driver</a></li>
				<li><a class="underlineHover" href="#">Create new account as passenger</a></li>
			</ul>

		</div>
	</div>

</form:form>
