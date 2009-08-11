
<%@ page import="propertymanagement.Unit" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Unit</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Unit List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Unit</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Unit</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${unitInstance}">
            <div class="errors">
                <g:renderErrors bean="${unitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${unitInstance?.id}" />
                <input type="hidden" name="version" value="${unitInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="property">Property:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitInstance,field:'property','errors')}">
                                    <g:select optionKey="id" from="${propertymanagement.Property.list()}" name="property.id" value="${unitInstance?.property?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:unitInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bedrooms">Bedrooms:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitInstance,field:'bedrooms','errors')}">
                                    <input type="text" id="bedrooms" name="bedrooms" value="${fieldValue(bean:unitInstance,field:'bedrooms')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bathrooms">Bathrooms:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitInstance,field:'bathrooms','errors')}">
                                    <input type="text" id="bathrooms" name="bathrooms" value="${fieldValue(bean:unitInstance,field:'bathrooms')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address">Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitInstance,field:'address','errors')}">
                                    <g:select optionKey="id" from="${propertymanagement.Address.list()}" name="address.id" value="${unitInstance?.address?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tenants">Tenants:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitInstance,field:'tenants','errors')}">
                                    
<ul>
<g:each var="t" in="${unitInstance?.tenants?}">
    <li><g:link controller="tenant" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="tenant" params="['unit.id':unitInstance?.id]" action="create">Add Tenant</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="expenses">Expenses:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitInstance,field:'expenses','errors')}">
                                    
<ul>
<g:each var="e" in="${unitInstance?.expenses?}">
    <li><g:link controller="expense" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="expense" params="['unit.id':unitInstance?.id]" action="create">Add Expense</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="leads">Leads:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitInstance,field:'leads','errors')}">
                                    
<ul>
<g:each var="l" in="${unitInstance?.leads?}">
    <li><g:link controller="lead" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="lead" params="['unit.id':unitInstance?.id]" action="create">Add Lead</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="receivables">Receivables:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitInstance,field:'receivables','errors')}">
                                    
<ul>
<g:each var="r" in="${unitInstance?.receivables?}">
    <li><g:link controller="receivable" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="receivable" params="['unit.id':unitInstance?.id]" action="create">Add Receivable</g:link>

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
