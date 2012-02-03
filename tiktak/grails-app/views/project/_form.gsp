<%@ page import="it.bz.tiktak.core.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="project.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="15" required="" value="${projectInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'descrI', 'error')} required">
	<label for="descrI">
		<g:message code="project.descrI.label" default="Descr I" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descrI" maxlength="200" required="" value="${projectInstance?.descrI}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'descrD', 'error')} required">
	<label for="descrD">
		<g:message code="project.descrD.label" default="Descr D" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descrD" maxlength="200" required="" value="${projectInstance?.descrD}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'service', 'error')} required">
	<label for="service">
		<g:message code="project.service.label" default="Service" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="service" name="service.id" from="${it.bz.tiktak.core.Service.list()}" optionKey="id" required="" value="${projectInstance?.service?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="project.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${projectInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectPersons', 'error')} ">
	<label for="projectPersons">
		<g:message code="project.projectPersons.label" default="Project Persons" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInstance?.projectPersons?}" var="p">
    <li><g:link controller="projectPerson" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="projectPerson" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'projectPerson.label', default: 'ProjectPerson')])}</g:link>
</li>
</ul>

</div>

