
<%@ page import="domain.Flight" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'flight.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="flightNumber" title="${message(code: 'flight.flightNumber.label', default: 'Flight Number')}" />
                        
                            <th><g:message code="flight.airline.label" default="Airline" /></th>
                        
                            <g:sortableColumn property="departureDate" title="${message(code: 'flight.departureDate.label', default: 'Departure Date')}" />
                        
                            <th><g:message code="flight.departureAirport.label" default="Departure Airport" /></th>
                        
                            <g:sortableColumn property="arrivalDate" title="${message(code: 'flight.arrivalDate.label', default: 'Arrival Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${flightInstanceList}" status="i" var="flightInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${flightInstance.id}">${fieldValue(bean: flightInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: flightInstance, field: "flightNumber")}</td>
                        
                            <td>${fieldValue(bean: flightInstance, field: "airline")}</td>
                        
                            <td><g:formatDate date="${flightInstance.departureDate}" /></td>
                        
                            <td>${fieldValue(bean: flightInstance, field: "departureAirport")}</td>
                        
                            <td><g:formatDate date="${flightInstance.arrivalDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${flightInstanceTotal}" />
            </div>
            <g:render template="/footer" />
        </div>
    </body>
</html>
