

<%@ page import="domain.HotelStay" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'hotelStay.label', default: 'HotelStay')}" />
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
            <g:hasErrors bean="${hotelStayInstance}">
            <div class="errors">
                <g:renderErrors bean="${hotelStayInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hotel"><g:message code="hotelStay.hotel.label" default="Hotel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: hotelStayInstance, field: 'hotel', 'errors')}">
                                    <g:textField name="hotel" value="${hotelStayInstance?.hotel}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="checkIn"><g:message code="hotelStay.checkIn.label" default="Check In" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: hotelStayInstance, field: 'checkIn', 'errors')}">
                                    <g:datePicker name="checkIn" precision="day" value="${hotelStayInstance?.checkIn}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="checkOut"><g:message code="hotelStay.checkOut.label" default="Check Out" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: hotelStayInstance, field: 'checkOut', 'errors')}">
                                    <g:datePicker name="checkOut" precision="day" value="${hotelStayInstance?.checkOut}"  />
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
