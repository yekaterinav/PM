
<%@ page import="propertymanagement.Property" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Property List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Property</g:link></span>
        </div>
        <div class="body">
            <h1>Property List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <!--<g:sortableColumn property="id" title="Id" />-->
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="type" title="Type" />
                        
                   	        <!--<th>Units</th>-->
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${propertyInstanceList}" status="i" var="propertyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <!--<td><g:link action="show" id="${propertyInstance.id}">${fieldValue(bean:propertyInstance, field:'id')}</g:link></td>-->
                        
                            <td><g:link action="show" id="${propertyInstance.id}">${fieldValue(bean:propertyInstance, field:'name')}</g:link></td>
                        
                            <td>${fieldValue(bean:propertyInstance, field:'type')}</td>
                        
                            <!--<td>${fieldValue(bean:propertyInstance, field:'units')}</td>-->
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${propertyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
