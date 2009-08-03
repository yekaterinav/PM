
<%@ page import="propertymanagement.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Address</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Address List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Address</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${addressInstance}">
            <div class="errors">
                <g:renderErrors bean="${addressInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="line1">Line1:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'line1','errors')}">
                                    <input type="text" id="line1" name="line1" value="${fieldValue(bean:addressInstance,field:'line1')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="line2">Line2:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'line2','errors')}">
                                    <input type="text" id="line2" name="line2" value="${fieldValue(bean:addressInstance,field:'line2')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'city','errors')}">
                                    <input type="text" id="city" name="city" value="${fieldValue(bean:addressInstance,field:'city')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state">State:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'state','errors')}">
                                    <input type="text" id="state" name="state" value="${fieldValue(bean:addressInstance,field:'state')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zip">Zip:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'zip','errors')}">
                                    <input type="text" id="zip" name="zip" value="${fieldValue(bean:addressInstance,field:'zip')}"/>
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
