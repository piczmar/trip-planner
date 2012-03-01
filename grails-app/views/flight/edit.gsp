

<%@ page import="domain.Flight" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${flightInstance}">
            <div class="errors">
                <g:renderErrors bean="${flightInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${flightInstance?.id}" />
                <g:hiddenField name="version" value="${flightInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="flightNumber"><g:message code="flight.flightNumber.label" default="Flight Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: flightInstance, field: 'flightNumber', 'errors')}">
                                    <g:textField name="flightNumber" value="${flightInstance?.flightNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="airline"><g:message code="flight.airline.label" default="Airline" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: flightInstance, field: 'airline', 'errors')}">
                                    <g:select name="airline.id" from="${domain.Airline.list()}" optionKey="id" value="${flightInstance?.airline?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="departureDate"><g:message code="flight.departureDate.label" default="Departure Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: flightInstance, field: 'departureDate', 'errors')}">
                                    <g:datePicker name="departureDate" precision="day" value="${flightInstance?.departureDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="departureAirport"><g:message code="flight.departureAirport.label" default="Departure Airport" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: flightInstance, field: 'departureAirport', 'errors')}">
                                    <g:select name="departureAirport.id" from="${domain.Airport.list()}" optionKey="id" value="${flightInstance?.departureAirport?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="arrivalDate"><g:message code="flight.arrivalDate.label" default="Arrival Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: flightInstance, field: 'arrivalDate', 'errors')}">
                                    <g:datePicker name="arrivalDate" precision="day" value="${flightInstance?.arrivalDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="arrivalAirport"><g:message code="flight.arrivalAirport.label" default="Arrival Airport" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: flightInstance, field: 'arrivalAirport', 'errors')}">
                                    <g:select name="arrivalAirport.id" from="${domain.Airport.list()}" optionKey="id" value="${flightInstance?.arrivalAirport?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="trip"><g:message code="flight.trip.label" default="Trip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: flightInstance, field: 'trip', 'errors')}">
                                    <g:select name="trip.id" from="${domain.Trip.list()}" optionKey="id" value="${flightInstance?.trip?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
