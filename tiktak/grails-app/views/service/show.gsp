
<%@ page import="it.bz.tiktak.core.Service" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'service.label', default: 'Service')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-service" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-service" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list service">
			
				<g:if test="${serviceInstance?.codice}">
				<li class="fieldcontain">
					<span id="codice-label" class="property-label"><g:message code="service.codice.label" default="Codice" /></span>
					
						<span class="property-value" aria-labelledby="codice-label"><g:fieldValue bean="${serviceInstance}" field="codice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.descrI}">
				<li class="fieldcontain">
					<span id="descrI-label" class="property-label"><g:message code="service.descrI.label" default="Descr I" /></span>
					
						<span class="property-value" aria-labelledby="descrI-label"><g:fieldValue bean="${serviceInstance}" field="descrI"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.descrD}">
				<li class="fieldcontain">
					<span id="descrD-label" class="property-label"><g:message code="service.descrD.label" default="Descr D" /></span>
					
						<span class="property-value" aria-labelledby="descrD-label"><g:fieldValue bean="${serviceInstance}" field="descrD"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="service.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${serviceInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${serviceInstance?.id}" />
					<g:link class="edit" action="edit" id="${serviceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
