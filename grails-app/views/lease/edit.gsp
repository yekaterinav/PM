
<%@ page import="propertymanagement.Lease" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Lease</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Lease List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Lease</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Lease</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${leaseInstance}">
            <div class="errors">
                <g:renderErrors bean="${leaseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${leaseInstance?.id}" />
                <input type="hidden" name="version" value="${leaseInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaseInstance,field:'type','errors')}">
                                    <input type="text" id="type" name="type" value="${fieldValue(bean:leaseInstance,field:'type')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="beginDate">Begin Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaseInstance,field:'beginDate','errors')}">
                                    <g:datePicker name="beginDate" value="${leaseInstance?.beginDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaseInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${leaseInstance?.endDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="deposit">Deposit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaseInstance,field:'deposit','errors')}">
                                    <input type="text" id="deposit" name="deposit" value="${fieldValue(bean:leaseInstance,field:'deposit')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rent">Rent:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaseInstance,field:'rent','errors')}">
                                    <input type="text" id="rent" name="rent" value="${fieldValue(bean:leaseInstance,field:'rent')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dueDate">Due Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaseInstance,field:'dueDate','errors')}">
                                    <g:datePicker name="dueDate" value="${leaseInstance?.dueDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lateDate">Late Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaseInstance,field:'lateDate','errors')}">
                                    <g:datePicker name="lateDate" value="${leaseInstance?.lateDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lateFee">Late Fee:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaseInstance,field:'lateFee','errors')}">
                                    <input type="text" id="lateFee" name="lateFee" value="${fieldValue(bean:leaseInstance,field:'lateFee')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comment">Comment:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaseInstance,field:'comment','errors')}">
                                    <input type="text" id="comment" name="comment" value="${fieldValue(bean:leaseInstance,field:'comment')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tenants">Tenants:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaseInstance,field:'tenants','errors')}">
                                    
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
