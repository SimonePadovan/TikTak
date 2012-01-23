
<%@ page import="it.bz.tiktak.core.Service" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'service.label', default: 'Service')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-service" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-service" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="codice" title="${message(code: 'service.codice.label', default: 'Codice')}" />
					
						<g:sortableColumn property="descrI" title="${message(code: 'service.descrI.label', default: 'Descr I')}" />
					
						<g:sortableColumn property="descrD" title="${message(code: 'service.descrD.label', default: 'Descr D')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'service.endDate.label', default: 'Data Fine')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceInstanceList}" status="i" var="serviceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serviceInstance.id}">${fieldValue(bean: serviceInstance, field: "codice")}</g:link></td>
					
						<td>${fieldValue(bean: serviceInstance, field: "descrI")}</td>
					
						<td>${fieldValue(bean: serviceInstance, field: "descrD")}</td>
					
						<td><g:formatDate date="${serviceInstance.endDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serviceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
