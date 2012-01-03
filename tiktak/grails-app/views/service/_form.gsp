<%@ page import="it.bz.tiktak.core.Service" %>


<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'codice', 'error')} ">
	<label for="codice">
		<g:message code="service.codice.label" default="Codice" />
		
	</label>
	<g:textField name="codice" value="${serviceInstance?.codice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'descrI', 'error')} required">
	<label for="descrI">
		<g:message code="service.descrI.label" default="Descr I" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descrI" required="" value="${serviceInstance?.descrI}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'descrD', 'error')} required">
	<label for="descrD">
		<g:message code="service.descrD.label" default="Descr D" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descrD" required="" value="${serviceInstance?.descrD}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'dataFine', 'error')} ">
	<label for="dataFine">
		<g:message code="service.dataFine.label" default="Data Fine" />
		
	</label>
	<g:datePicker name="dataFine" precision="day"  value="${serviceInstance?.dataFine}" default="none" noSelection="['': '']" />
</div>

