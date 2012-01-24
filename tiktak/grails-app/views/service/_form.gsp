<%@ page import="it.bz.tiktak.core.Service" %>



<div class="fieldcontain ${hasErrors(bean: serviceInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="service.code.label" default="Code" />
		
	</label>
	<g:textField name="code" maxlength="15" value="${serviceInstance?.code}"/>
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

