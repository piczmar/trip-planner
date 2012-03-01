

<%@ page import="domain.Airport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'airport.label', default: 'Airport')}" />
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
            <g:hasErrors bean="${airportInstance}">
            <div class="errors">
                <g:renderErrors bean="${airportInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${airportInstance?.id}" />
                <g:hiddenField name="version" value="${airportInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="airport.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: airportInstance, field: "name")}</td>
                            
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
                            <td valign="top" class="name"><g:message code="airport.state.label" default="State" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: airportInstance, field: "state")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="airport.country.label" default="Country" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: airportInstance, field: "country")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="airport.lat.label" default="Lat" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: airportInstance, field: "lat")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="airport.lng.label" default="Lng" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: airportInstance, field: "lng")}</td>
                            
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
