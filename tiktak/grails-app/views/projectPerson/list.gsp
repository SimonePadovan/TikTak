
<%@ page import="it.bz.tiktak.core.ProjectPerson" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectPerson.label', default: 'ProjectPerson')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectPerson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectPerson" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectPerson.person.label" default="Person" /></th>
					
						<th><g:message code="projectPerson.project.label" default="Project" /></th>
					
					    <g:sortableColumn property="endDate" title="${message(code: 'projectPerson.endDate.label', default: 'Data Fine')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectPersonInstanceList}" status="i" var="projectPersonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectPersonInstance.id}">${fieldValue(bean: projectPersonInstance, field: "person")}</g:link></td>
					
						<td>${fieldValue(bean: projectPersonInstance, field: "project")}</td>
						
						<td><g:formatDate date="${projectPersonInstance.endDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectPersonInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
