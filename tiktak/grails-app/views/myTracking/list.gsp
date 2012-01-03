
<%@ page import="it.bz.tiktak.core.Tracking" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myTracking.label', default: 'MyTracking')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-myTracking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>		
		
		<div id="list-myTracking" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" />
				<div class="alignright">
				  <g:formatDate date="${params.from}" /> .. <g:formatDate date="${params.to}" />:
				  <g:formatNumber number="${myTrackingInstanceList?.hours?.sum()}" format="0.00" />
				</div>
			</h1>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="myTracking.project.label" default="Project" /></th>
					
						<th><g:message code="myTracking.activity.label" default="Activity" /></th>
					
					    <th><g:message code="myTracking.hours.label" default="Hours" /></th>
					     
					    <th><g:message code="myTracking.detail.label" default="Detail" /></th>
					</tr>
				</thead>
				<tbody>
				
				<g:if test="${myTrackingInstanceList.size() != 0}">
				    <g:set var="currentDate" value="${myTrackingInstanceList?.first()?.date}" />
				    <g:set var="totalDate" value="${0}" />
				</g:if>
				<g:each in="${myTrackingInstanceList}" status="i" var="myTrackingInstance">
					<g:if test="${myTrackingInstance.date != currentDate}">
					 <tr class="group">
					       <td colspan="2">
					          <g:formatDate format="EEEEEEEEEEE"  date="${currentDate}" />,  
					          <g:formatDate date="${currentDate}" />
					       </td>
					       <td class="alignright">
					         <g:formatNumber number="${totalDate}" format="0.00" />
					       </td>
     				       <td></td>
					 </tr>
					    <g:set var="currentDate" value="${myTrackingInstance.date}" />
					    <g:set var="totalDate" value="${myTrackingInstance.hours}" />
					</g:if>
					<g:else>
					   <g:set var="totalDate" value="${myTrackingInstance.hours + totalDate}" />
					</g:else>
				
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${myTrackingInstance.id}">${fieldValue(bean: myTrackingInstance, field: "project")}</g:link></td>
					
						<td>${fieldValue(bean: myTrackingInstance, field: "activity")}</td>
					
						<td class="alignright"><g:formatNumber number="${myTrackingInstance.hours}" format="0.00" /></td>
						
						<td>${fieldValue(bean: myTrackingInstance, field: "detail")}</td>
					
					</tr>
					
				</g:each>
			
				<g:if test="${totalDate > 0}">
				 <tr class="group">
				       <td colspan="2">
				          <g:formatDate format="EEEEEEEEEEE"  date="${currentDate}" />,				            
				          <g:formatDate date="${currentDate}" />
				       </td>
				       <td  class="alignright">
				         <g:formatNumber number="${totalDate}" format="0.00" />
				       </td>
				       <td></td>
				 </tr>
				</g:if>			
				
				</tbody>
			</table>
			
			<div class="pagination" role="pagination">
				<g:link action="previousWeek"><g:message code="default.previousWeek.label" default="Previous week" /></g:link>
				<g:link action="currentWeek"><g:message code="default.currentWeek.label" default="Current week" /></g:link>
				<g:link action="nextWeek"><g:message code="default.nextWeek.label" default="Next week" /></g:link>
			</div>		
		</div>
	</body>
</html>
