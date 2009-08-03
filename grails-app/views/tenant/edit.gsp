
<%@ page import="propertymanagement.Tenant" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Tenant</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Tenant List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Tenant</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Tenant</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tenantInstance}">
            <div class="errors">
                <g:renderErrors bean="${tenantInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${tenantInstance?.id}" />
                <input type="hidden" name="version" value="${tenantInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">First Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tenantInstance,field:'firstName','errors')}">
                                    <input type="text" id="firstName" name="firstName" value="${fieldValue(bean:tenantInstance,field:'firstName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName">Last Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tenantInstance,field:'lastName','errors')}">
                                    <input type="text" id="lastName" name="lastName" value="${fieldValue(bean:tenantInstance,field:'lastName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contacts">Contacts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tenantInstance,field:'contacts','errors')}">
                                    
<ul>
<g:each var="c" in="${tenantInstance?.contacts?}">
    <li><g:link controller="contact" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="contact" params="['tenant.id':tenantInstance?.id]" action="create">Add Contact</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unit">Unit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tenantInstance,field:'unit','errors')}">
                                    <g:select optionKey="id" from="${propertymanagement.Unit.list()}" name="unit.id" value="${tenantInstance?.unit?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="moveInDate">Move In Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tenantInstance,field:'moveInDate','errors')}">
                                    <g:datePicker name="moveInDate" value="${tenantInstance?.moveInDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="moveOutDate">Move Out Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tenantInstance,field:'moveOutDate','errors')}">
                                    <g:datePicker name="moveOutDate" value="${tenantInstance?.moveOutDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="leases">Leases:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tenantInstance,field:'leases','errors')}">
                                    <g:select name="leases"
from="${propertymanagement.Lease.list()}"
size="5" multiple="yes" optionKey="id"
value="${tenantInstance?.leases}" />

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
