<%@ page import="it.bz.tiktak.core.Project" %>
<%@ page import="it.bz.tiktak.core.Service" %>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'codice', 'error')} ">
	<label for="codice">
		<g:message code="project.codice.label" default="Codice" />
		
	</label>
	<g:textField name="codice" value="${projectInstance?.codice}"/>
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

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'dataFine', 'error')} ">
	<label for="dataFine">
		<g:message code="project.dataFine.label" default="Data Fine" />
		
	</label>
	<g:datePicker name="dataFine" precision="day"  value="${projectInstance?.dataFine}" default="none" noSelection="['': '']" />
</div>

