

<%@ page import="domain.Flight" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
        
        <g:javascript library="prototype" />     
        
        <script type="text/javascript">
          function get(airportField){
            var baseUrl = "${createLink(controller:'airport', action:'getJson')}"
            var url = baseUrl + "?iata=" + $F(airportField+'Iata')
            //$F is a prototype shortcut to retrieve the value of an element. 
            // In this case, it's getting the selected value of the DOM element with id airportField+'Iata'.
            new Ajax.Request(url, {
              method: 'get',
              asynchronous: true,
              onSuccess: function(req) {update(req.responseText, airportField)}                          
            })
          }
          
          function update(json, airportField){
            var airport = eval( "(" + json + ")" )
            var output = $(airportField + "Text")
            output.innerHTML = airport.iata + " - " + airport.name // update the displayed text
            var hiddenField = $(airportField + ".id")
            airport.id == null ? hiddenField.value = -1 : hiddenField.value = airport.id // update the id to be sent with POST method
          }
          
          function validate(){
            if( $F("departureAirport.id") == -1 ){
              alert("Please supply a valid Departure Airport")
              return false
            }
            
            if( $F("arrivalAirport.id") == -1 ){
              alert("Please supply a valid Arrival Airport")
              return false
            }
            
            return true
          }
          
        </script>
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${flightInstance}">
            <div class="errors">
                <g:renderErrors bean="${flightInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save"  onsubmit="return validate()">
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
									<div id="departureAirportText">[Type an Airport IATA Code]</div> 
									<input type="hidden" name="departureAirport.id" value="-1" id="departureAirport.id" /> 
									<input type="text" name="departureAirportIata" id="departureAirportIata" /> 
									<input type="button" value="Find" onClick="get('departureAirport')" />
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
                                	<div id="arrivalAirportText">[Type an Airport IATA Code]</div> 
									<input type="hidden" name="arrivalAirport.id" value="-1" id="arrivalAirport.id" /> 
									<input type="text" name="arrivalAirportIata" id="arrivalAirportIata" /> 
									<input type="button" value="Find" onClick="get('arrivalAirport')" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="trip"><g:message code="flight.trip.label" default="Trip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: flightInstance, field: 'trip', 'errors')}">
                                    <g:select name="trip.id" from="${domain.Trip.listOrderByName()}" optionKey="id" value="${flightInstance?.trip?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
            <p>Just for test purpose list here all airports available in database </p>
            <g:select name="airport.id" from="${domain.Airport.list()}" optionKey="id" value=""  />
        </div>
    </body>
</html>
