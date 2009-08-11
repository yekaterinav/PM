
<%@ page import="propertymanagement.Receivable" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Receivable</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Receivable List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Receivable</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Receivable</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${receivableInstance}">
            <div class="errors">
                <g:renderErrors bean="${receivableInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${receivableInstance?.id}" />
                <input type="hidden" name="version" value="${receivableInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:receivableInstance,field:'type','errors')}">
                                    <input type="text" id="type" name="type" value="${fieldValue(bean:receivableInstance,field:'type')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="amount">Amount:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:receivableInstance,field:'amount','errors')}">
                                    <input type="text" id="amount" name="amount" value="${fieldValue(bean:receivableInstance,field:'amount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dueDate">Due Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:receivableInstance,field:'dueDate','errors')}">
                                    <g:datePicker name="dueDate" value="${receivableInstance?.dueDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="payment">Payment:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:receivableInstance,field:'payment','errors')}">
                                    
<ul>
<g:each var="p" in="${receivableInstance?.payment?}">
    <li><g:link controller="payment" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="payment" params="['receivable.id':receivableInstance?.id]" action="create">Add Payment</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unit">Unit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:receivableInstance,field:'unit','errors')}">
                                    <g:select optionKey="id" from="${propertymanagement.Unit.list()}" name="unit.id" value="${receivableInstance?.unit?.id}" ></g:select>
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
