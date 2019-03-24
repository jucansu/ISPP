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
		<i class="fa fa-envelope" style="font-size:35px">
		</i>
		<i class="fa fa-bell" style="font-size:35px">
		</i>
		<div class="user">
		</div>
	</div>
</div>


