
<%@ page import="propertymanagement.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Address List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Address</g:link></span>
        </div>
        <div class="body">
            <h1>Address List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="line1" title="Line1" />
                        
                   	        <g:sortableColumn property="line2" title="Line2" />
                        
                   	        <g:sortableColumn property="city" title="City" />
                        
                   	        <g:sortableColumn property="state" title="State" />
                        
                   	        <g:sortableColumn property="zip" title="Zip" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${addressInstanceList}" status="i" var="addressInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean:addressInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:addressInstance, field:'line1')}</td>
                        
                            <td>${fieldValue(bean:addressInstance, field:'line2')}</td>
                        
                            <td>${fieldValue(bean:addressInstance, field:'city')}</td>
                        
                            <td>${fieldValue(bean:addressInstance, field:'state')}</td>
                        
                            <td>${fieldValue(bean:addressInstance, field:'zip')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${addressInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
