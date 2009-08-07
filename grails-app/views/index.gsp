<html>
    <head>
        <title>Katya Yekaterina's Property Management Application</title>
		<meta name="layout" content="main" />
    </head>
    <body>
        <div class="dialog" style="margin: 20px;
								   padding-bottom: 10px;
			                       background-color: #fff;
								   border: 1px #ccc solid;">
            <ul>
<!--				<li class="controller"><g:link controller="property">Properties</g:link></li>
				<li class="controller"><g:link controller="unit">Units</g:link></li>
				<li class="controller"><g:link controller="address">Addresses</g:link></li>
				<li class="controller"><g:link controller="tenant">Tenants</g:link></li>
				<li class="controller"><g:link controller="contact">Contacts</g:link></li> -->
              <g:each var="c" in="${grailsApplication.controllerClasses}">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.logicalPropertyName}</g:link></li>
                    <!--<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li> -->
              </g:each>
            </ul>
        </div>
    </body>
</html>