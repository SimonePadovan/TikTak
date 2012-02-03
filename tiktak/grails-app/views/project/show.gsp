
<%@ page import="it.bz.tiktak.core.Project" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-project" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list project">
			
				<g:if test="${projectInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="project.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${projectInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.descrI}">
				<li class="fieldcontain">
					<span id="descrI-label" class="property-label"><g:message code="project.descrI.label" default="Descr I" /></span>
					
						<span class="property-value" aria-labelledby="descrI-label"><g:fieldValue bean="${projectInstance}" field="descrI"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.descrD}">
				<li class="fieldcontain">
					<span id="descrD-label" class="property-label"><g:message code="project.descrD.label" default="Descr D" /></span>
					
						<span class="property-value" aria-labelledby="descrD-label"><g:fieldValue bean="${projectInstance}" field="descrD"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.service}">
				<li class="fieldcontain">
					<span id="service-label" class="property-label"><g:message code="project.service.label" default="Service" /></span>
					
						<span class="property-value" aria-labelledby="service-label"><g:link controller="service" action="show" id="${projectInstance?.service?.id}">${projectInstance?.service?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="project.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${projectInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.projectPersons}">
				<li class="fieldcontain">
					<span id="projectPersons-label" class="property-label"><g:message code="project.projectPersons.label" default="Project Persons" /></span>
					
						<g:each in="${projectInstance.projectPersons}" var="p">
						<span class="property-value" aria-labelledby="projectPersons-label"><g:link controller="projectPerson" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
