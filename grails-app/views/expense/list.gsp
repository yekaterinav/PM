
<%@ page import="propertymanagement.Expense" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Expense List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Expense</g:link></span>
        </div>
        <div class="body">
            <h1>Expense List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="category" title="Category" />
                        
                   	        <g:sortableColumn property="type" title="Type" />
                        
                   	        <g:sortableColumn property="amount" title="Amount" />
                        
                   	        <g:sortableColumn property="date" title="Date" />
                        
                   	        <g:sortableColumn property="store" title="Store" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${expenseInstanceList}" status="i" var="expenseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${expenseInstance.id}">${fieldValue(bean:expenseInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:expenseInstance, field:'category')}</td>
                        
                            <td>${fieldValue(bean:expenseInstance, field:'type')}</td>
                        
                            <td>${fieldValue(bean:expenseInstance, field:'amount')}</td>
                        
                            <td>${fieldValue(bean:expenseInstance, field:'date')}</td>
                        
                            <td>${fieldValue(bean:expenseInstance, field:'store')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${expenseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
