<%@ page import="it.bz.tiktak.core.Project" %>
<%@ page import="it.bz.tiktak.core.Service" %>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="project.code.label" default="code" />
		
	</label>
	<g:textField name="code" value="${projectInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'descrI', 'error')} required">
	<label for="descrI">
		<g:message code="project.descrI.label" default="Descr I" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descrI" required="" value="${projectInstance?.descrI}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'descrD', 'error')} required">
	<label for="descrD">
		<g:message code="project.descrD.label" default="Descr D" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descrD" required="" value="${projectInstance?.descrD}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'service', 'error')} required">
	<label for="service">
		<g:message code="project.service.label" default="Service" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="service" name="service.id" from="${Service.list()}" optionKey="id" required="" value="${projectInstance?.service?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="project.endDate.label" default="Data Fine" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${projectInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

