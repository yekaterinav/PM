
<%@ page import="propertymanagement.Contact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Contact List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Contact</g:link></span>
        </div>
        <div class="body">
            <h1>Contact List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="type" title="Type" />
                        
                   	        <g:sortableColumn property="phoneNumber" title="Phone Number" />
                        
                   	        <g:sortableColumn property="emailAddress" title="Email Address" />
                        
                   	        <th>Person</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contactInstanceList}" status="i" var="contactInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${contactInstance.id}">${fieldValue(bean:contactInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:contactInstance, field:'type')}</td>
                        
                            <td>${fieldValue(bean:contactInstance, field:'phoneNumber')}</td>
                        
                            <td>${fieldValue(bean:contactInstance, field:'emailAddress')}</td>
                        
                            <td>${fieldValue(bean:contactInstance, field:'person')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${contactInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
