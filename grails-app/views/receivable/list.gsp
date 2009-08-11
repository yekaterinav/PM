
<%@ page import="propertymanagement.Receivable" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Receivable List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Receivable</g:link></span>
        </div>
        <div class="body">
            <h1>Receivable List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="type" title="Type" />
                        
                   	        <g:sortableColumn property="amount" title="Amount" />
                        
                   	        <g:sortableColumn property="dueDate" title="Due Date" />
                        
                   	        <th>Unit</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${receivableInstanceList}" status="i" var="receivableInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${receivableInstance.id}">${fieldValue(bean:receivableInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:receivableInstance, field:'type')}</td>
                        
                            <td>${fieldValue(bean:receivableInstance, field:'amount')}</td>
                        
                            <td>${fieldValue(bean:receivableInstance, field:'dueDate')}</td>
                        
                            <td>${fieldValue(bean:receivableInstance, field:'unit')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${receivableInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
