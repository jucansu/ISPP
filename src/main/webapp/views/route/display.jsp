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

	<spring:url value="/styles/route.css" var="routecss" />
	<link href="${routecss}" rel="stylesheet" />
	<script src="${routecss}"></script>
<head>
        <title>Accordion</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    </head>
    <body>

	<jstl:out value="${route.origin}"/><br />
	<jstl:out value="${route.destination}"/><br />
	<jstl:out value="${route.departureDate}"/><br />
	
        <div class="container ">
            <div class="col-md-12">
                
                    <div class="col-md-6 d-flex flex-column justify-content-xl-center">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Route
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body d-flex flex-row justify-content-xl-center">
                                   			<p><jstl:out value="${route.origin}"/></p>
											<p><jstl:out value="${route.destination}"/></p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Details
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <jstl:out value="${route.driver.name}"/><br /><jstl:out value="${route.driver.surname}"/><br />
                                        
                                        <div class="preferences" style="width: 8rem;">
  													Preferences:
							
                                        	<jstl:if test="${route.driver.pets == true}">
                                        		<p>Pets</p>
                                        	</jstl:if>
                                        	
                                        	<%-- <jstl:if test="${route.driver.pets == false}">
                                        		<p>Pets</p>
                                        	</jstl:if> --%>
                                        	
                                        	<jstl:if test="${route.driver.music == true}">
                                        		<p>Music</p>
                                        	</jstl:if>
                                        	
                                        	<%-- <jstl:if test="${route.driver.music == false}">
                                        		<p>Music</p>
                                        	</jstl:if> --%>
                                        	
                                        	<jstl:if test="${route.driver.smoke == true}">
                                        		<p>Smoke</p>
                                        	</jstl:if>
                                        	
                                        	<%-- <jstl:if test="${route.driver.smoke == false}">
                                        		<p>Smoke</p>
                                        	</jstl:if> --%>
                                        	<jstl:if test="${route.driver.childs == true}">
                                        		<p>Children</p>
                                        	</jstl:if>
                                        	<%-- <jstl:if test="${route.driver.childs == false}">
                                        		<p>Children</p>
                                        	</jstl:if> --%>
                                        	
                                        	<div class="luggage" style="width: 8rem;">
                                        Luggage size:
                                        <jstl:out value="${route.maxLuggage}"/><br />
                                        </div>
                                         <div class="Vehicle" style="width: 8rem;">
                                        Vehicle:
                                        <img src="${route.vehicle.image}" width="200" height="150"/>
                                        <jstl:out value="${route.vehicle.type}"/><br />Model:
                                        <jstl:out value="${route.vehicle.model}"/><br />Brand:
                                        <jstl:out value="${route.vehicle.vehicleBrand}"/><br /> Plate:
                                        <jstl:out value="${route.vehicle.plate}"/><br /> Description:
                                        <jstl:out value="${route.vehicle.description}"/><br />
                                        </div>
                                        	
                                        </div>
                                        
                                </div>
                            </div>
                            
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            Seats
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									<%-- <jstl:out value="${route.availableSeats}"></jstl:out><br/> --%>
									<p>
										Origin: &nbsp
										<jstl:out value="${route.origin }"></jstl:out>
									</p>

									<p>
										Destination: &nbsp
										<jstl:out value="${route.destination }"></jstl:out>
									</p>

									<p>Luggage: &nbsp</p>


									<p>Seats: &nbsp <jstl:out value="${route.availableSeats}"></jstl:out><br/></p>


									<p>
										Total: &nbsp
										<jstl:out value="${route.pricePerPassenger }"></jstl:out>
										euros
									</p>
								</div>


								<div class="cancelled">

									<jstl:if test="${route.isCancelled == false }">

										<jstl:if test="${route.availableSeats > 0 }">

											<button class="btn" type="button">REQUEST</button>

										</jstl:if>

									</jstl:if>

								</div>
								</div>
							</div>
                            </div>
                        </div>
                    </div>
                
            </div>
        </div>
        </body>
        
   <security:authorize access="hasRole('DRIVER')">
   <button class="btn" type="button">CANCEL ROUTE</button>
   </security:authorize>