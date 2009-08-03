
<%@ page import="propertymanagement.Unit" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Unit</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Unit List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Unit</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${unitInstance}">
            <div class="errors">
                <g:renderErrors bean="${unitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
