
<%@ page import="propertymanagement.Lead" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Lead List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Lead</g:link></span>
        </div>
        <div class="body">
            <h1>Lead List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="contact" title="Contact" />
                        
                   	        <g:sortableColumn property="date" title="Date" />
                        
                   	        <g:sortableColumn property="comment" title="Comment" />
                        
                   	        <th>Unit</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${leadInstanceList}" status="i" var="leadInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${leadInstance.id}">${fieldValue(bean:leadInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:leadInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:leadInstance, field:'contact')}</td>
                        
                            <td>${fieldValue(bean:leadInstance, field:'date')}</td>
                        
                            <td>${fieldValue(bean:leadInstance, field:'comment')}</td>
                        
                            <td>${fieldValue(bean:leadInstance, field:'unit')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${leadInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
