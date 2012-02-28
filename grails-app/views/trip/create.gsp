

<%@ page import="domain.Trip" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'trip.label', default: 'Trip')}" />
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
            <g:hasErrors bean="${tripInstance}">
            <div class="errors">
                <g:renderErrors bean="${tripInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="trip.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${tripInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="trip.endDate.label" default="End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="day" value="${tripInstance?.endDate}"  />
                                </td>
                            </tr>
                        
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
                                    <label for="notes"><g:message code="trip.notes.label" default="Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'notes', 'errors')}">
                                    <g:textField name="notes" value="${tripInstance?.notes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="purpose"><g:message code="trip.purpose.label" default="Purpose" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'purpose', 'errors')}">
                                    <g:textField name="purpose" value="${tripInstance?.purpose}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="trip.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tripInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="day" value="${tripInstance?.startDate}"  />
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
