
<%@ page import="propertymanagement.Payment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Payment</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Payment List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Payment</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Payment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${paymentInstance}">
            <div class="errors">
                <g:renderErrors bean="${paymentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${paymentInstance?.id}" />
                <input type="hidden" name="version" value="${paymentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="receivable">Receivable:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:paymentInstance,field:'receivable','errors')}">
                                    <g:select optionKey="id" from="${propertymanagement.Receivable.list()}" name="receivable.id" value="${paymentInstance?.receivable?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="amount">Amount:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:paymentInstance,field:'amount','errors')}">
                                    <input type="text" id="amount" name="amount" value="${fieldValue(bean:paymentInstance,field:'amount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateReceived">Date Received:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:paymentInstance,field:'dateReceived','errors')}">
                                    <g:datePicker name="dateReceived" value="${paymentInstance?.dateReceived}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="receivedFrom">Received From:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:paymentInstance,field:'receivedFrom','errors')}">
                                    <input type="text" id="receivedFrom" name="receivedFrom" value="${fieldValue(bean:paymentInstance,field:'receivedFrom')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
