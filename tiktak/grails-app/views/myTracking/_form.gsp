<%@ page import="it.bz.tiktak.core.Tracking" %>
<%@ page import="it.bz.tiktak.core.Project" %>
<%@ page import="it.bz.tiktak.core.Activity" %>

<g:javascript>
//Associa automaticamente agli input type=date il calendario jQueryUi 
$(document).ready(function()
	    {
	      $(':input[type=date]').each(function(index, value) {
	          $(this).datepicker({dateFormat: '${message(code: "jsDateFormat", default: "dd/mm/yy")}', 
	              showButtonPanel: true });          
	      });
	    })
</g:javascript>	    

<div class="fieldcontain ${hasErrors(bean: myTrackingInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="myTracking.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
    <g:select onchange="${remoteFunction(action: 'refreshActivities', update: 'activity', params:'\'id=\'+this.value+\'&validOn=\'+document.getElementById(\'date\').value+\'&activityId=\'+document.getElementById(\'activity\').value')}" id="project" name="project.id" from="${myTrackingInstance?.person?.getProjects(myTrackingInstance?.date) ?: Project.list()}" optionKey="id"  noSelection="${['':'Select one...']}"  required="" value="${myTrackingInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myTrackingInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="myTracking.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	
	<g:select id="activity" name="activity.id" from="${myTrackingInstance?.project?.activities}" optionKey="id" required="" value="${myTrackingInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myTrackingInstance, field: 'hours', 'error')} required">
	<label for="hours">
		<g:message code="myTracking.hours.label" default="Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="hours" min="0.15" max="12.0" required="" value="${fieldValue(bean: myTrackingInstance, field: 'hours')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myTrackingInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="myTracking.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:javascript>
	function updateActivity( ) {
		document.getElementById('project').onchange();  
    }
	</g:javascript>
	<g:field type="date" name="date" onchange="${remoteFunction(onSuccess:"updateActivity()", action: 'refreshProjects', update: 'project', params:'\'id=\'+document.getElementById(\'project\').value+\'&validOn=\'+this.value+\'&activityId=\'+document.getElementById(\'activity\').value')}"  value="${formatDate(date:myTrackingInstance?.date)}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: myTrackingInstance, field: 'detail', 'error')} ">
	<label for="detail">
		<g:message code="myTracking.detail.label" default="Detail" />		
	</label>
	<g:textArea name="detail"  cols="40"  value="${myTrackingInstance?.detail}" rows="2"  maxlength="1000" />
</div>


