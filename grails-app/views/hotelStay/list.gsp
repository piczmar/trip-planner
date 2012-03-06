
<%@ page import="domain.HotelStay" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'hotelStay.label', default: 'HotelStay')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'hotelStay.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="hotel" title="${message(code: 'hotelStay.hotel.label', default: 'Hotel')}" />
                        
                            <g:sortableColumn property="checkIn" title="${message(code: 'hotelStay.checkIn.label', default: 'Check In')}" />
                        
                            <g:sortableColumn property="checkOut" title="${message(code: 'hotelStay.checkOut.label', default: 'Check Out')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${hotelStayInstanceList}" status="i" var="hotelStayInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${hotelStayInstance.id}">${fieldValue(bean: hotelStayInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: hotelStayInstance, field: "hotel")}</td>
                        
                            <td><g:formatDate date="${hotelStayInstance.checkIn}" /></td>
                        
                            <td><g:formatDate date="${hotelStayInstance.checkOut}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${hotelStayInstanceTotal}" />
            </div>
            <g:render template="/footer" />
        </div>
    </body>
</html>
