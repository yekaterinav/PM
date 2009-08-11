
<%@ page import="propertymanagement.Payment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Payment</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Payment List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Payment</g:link></span>
        </div>
        <div class="body">
            <h1>Show Payment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:paymentInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Receivable:</td>
                            
                            <td valign="top" class="value"><g:link controller="receivable" action="show" id="${paymentInstance?.receivable?.id}">${paymentInstance?.receivable?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Amount:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:paymentInstance, field:'amount')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Received:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:paymentInstance, field:'dateReceived')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Received From:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:paymentInstance, field:'receivedFrom')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${paymentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
