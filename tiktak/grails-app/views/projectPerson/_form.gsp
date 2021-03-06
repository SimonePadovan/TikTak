<%@ page import="it.bz.tiktak.core.ProjectPerson" %>
<%@ page import="it.bz.tiktak.core.Project" %>
<%@ page import="it.bz.organization.core.Person" %>

<div class="fieldcontain ${hasErrors(bean: projectPersonInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="projectPerson.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${Person.list()}" optionKey="id" required="" value="${projectPersonInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectPersonInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="projectPerson.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${Project.list()}" optionKey="id" required="" value="${projectPersonInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectPersonInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="projectPerson.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${projectPersonInstance?.endDate}" default="none" noSelection="['': '']" />
</div>


