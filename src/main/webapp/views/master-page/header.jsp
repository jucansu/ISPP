<%--
 * header.jsp
 *
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

	<spring:url value="/styles/header.css" var="headercss" />
	<link href="${headercss}" rel="stylesheet" />
	<script src="${headercss}"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class=header>
	<div class="logo">
		<img src="images/logoicon.png"/>
	</div>

	<div class="headerContent">
		<div class="menuIcon">
			<div class="hamburguer"></div>
			<div class="hamburguer"></div>
			<div class="hamburguer"></div>
		</div>
		<i class="fa fa-envelope" style="font-size: 35px"> </i> <i
			class="fa fa-bell" style="font-size: 35px"> </i>
		<div class="user">
			<div>
				<ul id="jMenu">
					<!-- Do not forget the "fNiv" class for the first level links !! -->
					<security:authorize access="hasRole('ADMIN')">
						<li><a class="fNiv"><spring:message
									code="master.page.administrator" /></a>
							<ul>
								<%-- 
					<li class="arrow"></li>
					<li><a href="administrator/action-1.do"><spring:message code="master.page.administrator.action.1" /></a></li>
					<li><a href="administrator/action-2.do"><spring:message code="master.page.administrator.action.2" /></a></li>	 
					--%>
							</ul></li>
					</security:authorize>

					<security:authorize access="hasRole('CUSTOMER')">
						<li><a class="fNiv"><spring:message
									code="master.page.customer" /></a>
							<ul>
								<%-- 
					<li class="arrow"></li>
					<li><a href="customer/action-1.do"><spring:message code="master.page.customer.action.1" /></a></li>
					<li><a href="customer/action-2.do"><spring:message code="master.page.customer.action.2" /></a></li>	 
					--%>
							</ul></li>
					</security:authorize>

					<security:authorize access="isAnonymous()">
						<li><a class="fNiv" href="security/login.do"><spring:message
									code="master.page.login" /></a></li>
					</security:authorize>

					<security:authorize access="isAuthenticated()">
						<li><a class="fNiv"> <spring:message
									code="master.page.profile" /> (<security:authentication
									property="principal.username" />)
						</a>
							<ul>
								<%-- 
					<li class="arrow"></li>
					<li><a href="profile/action-1.do"><spring:message code="master.page.profile.action.1" /></a></li>
					<li><a href="profile/action-2.do"><spring:message code="master.page.profile.action.2" /></a></li>
					<li><a href="profile/action-3.do"><spring:message code="master.page.profile.action.3" /></a></li>					
					<li><a href="j_spring_security_logout"><spring:message code="master.page.logout" /> </a></li> 
					--%>
							</ul></li>
					</security:authorize>
				</ul>
			</div>
		</div>
	</div>

</div>


