
<%@ page import="it.bz.tiktak.core.Tracking" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tracking.label', default: 'Tracking')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tracking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tracking" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tracking">
			
				<g:if test="${trackingInstance?.project}">
				<li class="fieldcontain">
					<span id="project-label" class="property-label"><g:message code="tracking.project.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="project-label"><g:link controller="project" action="show" id="${trackingInstance?.project?.id}">${trackingInstance?.project?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackingInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="tracking.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${trackingInstance?.activity?.id}">${trackingInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackingInstance?.hours}">
				<li class="fieldcontain">
					<span id="hours-label" class="property-label"><g:message code="tracking.hours.label" default="Hours" /></span>
					
						<span class="property-value" aria-labelledby="hours-label"><g:fieldValue bean="${trackingInstance}" field="hours"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackingInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="tracking.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${trackingInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackingInstance?.detail}">
				<li class="fieldcontain">
					<span id="detail-label" class="property-label"><g:message code="tracking.detail.label" default="Detail" /></span>
					
						<span class="property-value" aria-labelledby="detail-label"><g:fieldValue bean="${trackingInstance}" field="detail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackingInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="tracking.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${trackingInstance?.person?.id}">${trackingInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${trackingInstance?.id}" />
					<g:link class="edit" action="edit" id="${trackingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
