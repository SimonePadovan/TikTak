
<%@ page import="it.bz.tiktak.core.Tracking" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tracking.label', default: 'Tracking')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tracking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tracking" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="tracking.project.label" default="Project" /></th>
					
						<th><g:message code="tracking.activity.label" default="Activity" /></th>
					
						<g:sortableColumn property="hours" title="${message(code: 'tracking.hours.label', default: 'Hours')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'tracking.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="detail" title="${message(code: 'tracking.detail.label', default: 'Detail')}" />
					
						<th><g:message code="tracking.person.label" default="Person" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${trackingInstanceList}" status="i" var="trackingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${trackingInstance.id}">${fieldValue(bean: trackingInstance, field: "project")}</g:link></td>
					
						<td>${fieldValue(bean: trackingInstance, field: "activity")}</td>
					
						<td>${fieldValue(bean: trackingInstance, field: "hours")}</td>
					
						<td><g:formatDate date="${trackingInstance.date}" /></td>
					
						<td>${fieldValue(bean: trackingInstance, field: "detail")}</td>
					
						<td>${fieldValue(bean: trackingInstance, field: "person")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${trackingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
