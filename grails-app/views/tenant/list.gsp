
<%@ page import="propertymanagement.Tenant" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Tenant List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Tenant</g:link></span>
        </div>
        <div class="body">
            <h1>Tenant List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="firstName" title="First Name" />
                        
                   	        <g:sortableColumn property="lastName" title="Last Name" />
                        
                   	        <th>Unit</th>
                   	    
                   	        <g:sortableColumn property="moveInDate" title="Move In Date" />
                        
                   	        <g:sortableColumn property="moveOutDate" title="Move Out Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tenantInstanceList}" status="i" var="tenantInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tenantInstance.id}">${fieldValue(bean:tenantInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:tenantInstance, field:'firstName')}</td>
                        
                            <td>${fieldValue(bean:tenantInstance, field:'lastName')}</td>
                        
                            <td>${fieldValue(bean:tenantInstance, field:'unit')}</td>
                        
                            <td>${fieldValue(bean:tenantInstance, field:'moveInDate')}</td>
                        
                            <td>${fieldValue(bean:tenantInstance, field:'moveOutDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tenantInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
