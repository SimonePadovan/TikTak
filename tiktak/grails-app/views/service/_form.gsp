<%@ page import="it.bz.tiktak.core.Service" %>



<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="service.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="15" required="" value="${serviceInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'descrI', 'error')} required">
	<label for="descrI">
		<g:message code="service.descrI.label" default="Descr I" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descrI" maxlength="200" required="" value="${serviceInstance?.descrI}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'descrD', 'error')} required">
	<label for="descrD">
		<g:message code="service.descrD.label" default="Descr D" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descrD" maxlength="200" required="" value="${serviceInstance?.descrD}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="service.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${serviceInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'activities', 'error')} ">
	<label for="activities">
		<g:message code="service.activities.label" default="Activities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${serviceInstance?.activities?}" var="a">
    <li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activity" action="create" params="['service.id': serviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activity.label', default: 'Activity')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'projects', 'error')} ">
	<label for="projects">
		<g:message code="service.projects.label" default="Projects" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${serviceInstance?.projects?}" var="p">
    <li><g:link controller="project" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="project" action="create" params="['service.id': serviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'project.label', default: 'Project')])}</g:link>
</li>
</ul>

</div>

