<%@ page import="it.bz.tiktak.core.Activity" %>
<%@ page import="it.bz.tiktak.core.Service" %>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'descrI', 'error')} required">
	<label for="descrI">
		<g:message code="activity.descrI.label" default="Descr I" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descrI" required="" value="${activityInstance?.descrI}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'descrD', 'error')} required">
	<label for="descrD">
		<g:message code="activity.descrD.label" default="Descr D" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descrD" required="" value="${activityInstance?.descrD}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'service', 'error')} required">
	<label for="service">
		<g:message code="activity.service.label" default="Service" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="service" name="service.id" from="${Service.list()}" optionKey="id" required="" value="${activityInstance?.service?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="activity.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${activityInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

