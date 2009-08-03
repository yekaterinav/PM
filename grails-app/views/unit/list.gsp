
<%@ page import="propertymanagement.Unit" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Unit List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Unit</g:link></span>
        </div>
        <div class="body">
            <h1>Unit List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Property</th>
                   	    
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="bedrooms" title="Bedrooms" />
                        
                   	        <g:sortableColumn property="bathrooms" title="Bathrooms" />
                        
                   	        <th>Address</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${unitInstanceList}" status="i" var="unitInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${unitInstance.id}">${fieldValue(bean:unitInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:unitInstance, field:'property')}</td>
                        
                            <td>${fieldValue(bean:unitInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:unitInstance, field:'bedrooms')}</td>
                        
                            <td>${fieldValue(bean:unitInstance, field:'bathrooms')}</td>
                        
                            <td>${fieldValue(bean:unitInstance, field:'address')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${unitInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
