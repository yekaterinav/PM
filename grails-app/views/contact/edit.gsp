
<%@ page import="propertymanagement.Contact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Contact</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Contact List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Contact</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Contact</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${contactInstance}">
            <div class="errors">
                <g:renderErrors bean="${contactInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${contactInstance?.id}" />
                <input type="hidden" name="version" value="${contactInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:contactInstance,field:'type','errors')}">
                                    <input type="text" id="type" name="type" value="${fieldValue(bean:contactInstance,field:'type')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneNumber">Phone Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:contactInstance,field:'phoneNumber','errors')}">
                                    <input type="text" id="phoneNumber" name="phoneNumber" value="${fieldValue(bean:contactInstance,field:'phoneNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="emailAddress">Email Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:contactInstance,field:'emailAddress','errors')}">
                                    <input type="text" id="emailAddress" name="emailAddress" value="${fieldValue(bean:contactInstance,field:'emailAddress')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person">Person:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:contactInstance,field:'person','errors')}">
                                    <g:select optionKey="id" from="${propertymanagement.Person.list()}" name="person.id" value="${contactInstance?.person?.id}" ></g:select>
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
