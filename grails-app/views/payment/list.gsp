
<%@ page import="propertymanagement.Payment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Payment List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Payment</g:link></span>
        </div>
        <div class="body">
            <h1>Payment List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Receivable</th>
                   	    
                   	        <g:sortableColumn property="amount" title="Amount" />
                        
                   	        <g:sortableColumn property="dateReceived" title="Date Received" />
                        
                   	        <g:sortableColumn property="receivedFrom" title="Received From" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paymentInstanceList}" status="i" var="paymentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paymentInstance.id}">${fieldValue(bean:paymentInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:paymentInstance, field:'receivable')}</td>
                        
                            <td>${fieldValue(bean:paymentInstance, field:'amount')}</td>
                        
                            <td>${fieldValue(bean:paymentInstance, field:'dateReceived')}</td>
                        
                            <td>${fieldValue(bean:paymentInstance, field:'receivedFrom')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${paymentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
