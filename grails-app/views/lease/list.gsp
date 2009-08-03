
<%@ page import="propertymanagement.Lease" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Lease List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Lease</g:link></span>
        </div>
        <div class="body">
            <h1>Lease List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="type" title="Type" />
                        
                   	        <g:sortableColumn property="beginDate" title="Begin Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                   	        <g:sortableColumn property="deposit" title="Deposit" />
                        
                   	        <g:sortableColumn property="rent" title="Rent" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${leaseInstanceList}" status="i" var="leaseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${leaseInstance.id}">${fieldValue(bean:leaseInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:leaseInstance, field:'type')}</td>
                        
                            <td>${fieldValue(bean:leaseInstance, field:'beginDate')}</td>
                        
                            <td>${fieldValue(bean:leaseInstance, field:'endDate')}</td>
                        
                            <td>${fieldValue(bean:leaseInstance, field:'deposit')}</td>
                        
                            <td>${fieldValue(bean:leaseInstance, field:'rent')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${leaseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
