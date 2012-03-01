

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
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
    		<p><a href="http://www.world-airport-codes.com/alphabetical/country-name/p.html">List of available IATA codes</a></p>
        </div>
    </body>
    
</html>
