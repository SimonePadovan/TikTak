<%@ page import="it.bz.tiktak.core.Tracking" %>



<div class="fieldcontain ${hasErrors(bean: trackingInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="tracking.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${it.bz.tiktak.core.Project.list()}" optionKey="id" required="" value="${trackingInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trackingInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="tracking.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${it.bz.tiktak.core.Activity.list()}" optionKey="id" required="" value="${trackingInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trackingInstance, field: 'hours', 'error')} required">
	<label for="hours">
		<g:message code="tracking.hours.label" default="Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="hours" min="0.15" max="12.0" required="" value="${fieldValue(bean: trackingInstance, field: 'hours')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trackingInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="tracking.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${trackingInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: trackingInstance, field: 'detail', 'error')} ">
	<label for="detail">
		<g:message code="tracking.detail.label" default="Detail" />
		
	</label>
	<g:textArea name="detail" cols="40" rows="5" maxlength="1000" value="${trackingInstance?.detail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trackingInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="tracking.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${it.bz.tiktak.core.Person.list()}" optionKey="id" required="" value="${trackingInstance?.person?.id}" class="many-to-one"/>
</div>

