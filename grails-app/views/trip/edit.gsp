

<%@ page import="domain.Trip" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'trip.label', default: 'Trip')}" />
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
            <g:hasErrors bean="${tripInstance}">
            <div class="errors">
                <g:renderErrors bean="${tripInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${tripInstance?.id}" />
                <g:hiddenField name="version" value="${tripInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="trip.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${tripInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="flights"><g:message code="trip.flights.label" default="Flights" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'flights', 'errors')}">
                                    
<ul>
<g:each in="${tripInstance?.flights?}" var="f">
    <li><g:link controller="flight" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="flight" action="create" params="['trip.id': tripInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'flight.label', default: 'Flight')])}</g:link>

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
