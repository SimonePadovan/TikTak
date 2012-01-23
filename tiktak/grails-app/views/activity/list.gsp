
<%@ page import="it.bz.tiktak.core.Activity" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descrI" title="${message(code: 'activity.descrI.label', default: 'Descr I')}" />
					
						<g:sortableColumn property="descrD" title="${message(code: 'activity.descrD.label', default: 'Descr D')}" />
					
						<th><g:message code="activity.service.label" default="Service" /></th>
					
						<g:sortableColumn property="endDate" title="${message(code: 'activity.endDate.label', default: 'End Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityInstanceList}" status="i" var="activityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityInstance.id}">${fieldValue(bean: activityInstance, field: "descrI")}</g:link></td>
					
						<td>${fieldValue(bean: activityInstance, field: "descr"+localeSuffix())}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "service")}</td>
					
						<td><g:formatDate date="${activityInstance.endDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="pagination">
				<g:paginate total="${activityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
