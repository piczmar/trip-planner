

<%@ page import="domain.Airport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'airport.label', default: 'Airport')}" />
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
            <g:hasErrors bean="${airportInstance}">
            <div class="errors">
                <g:renderErrors bean="${airportInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="airport.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: airportInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${airportInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="iata"><g:message code="airport.iata.label" default="Iata" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: airportInstance, field: 'iata', 'errors')}">
                                    <g:textField name="iata" maxlength="3" value="${airportInstance?.iata}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="airport.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: airportInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${airportInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state"><g:message code="airport.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: airportInstance, field: 'state', 'errors')}">
                                    <g:textField name="state" maxlength="2" value="${airportInstance?.state}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country"><g:message code="airport.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: airportInstance, field: 'country', 'errors')}">
                                    <g:textField name="country" value="${airportInstance?.country}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lat"><g:message code="airport.lat.label" default="Lat" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: airportInstance, field: 'lat', 'errors')}">
                                    <g:textField name="lat" value="${airportInstance?.lat}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lng"><g:message code="airport.lng.label" default="Lng" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: airportInstance, field: 'lng', 'errors')}">
                                    <g:textField name="lng" value="${airportInstance?.lng}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
