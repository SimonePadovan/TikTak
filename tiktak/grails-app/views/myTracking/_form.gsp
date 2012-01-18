<%@ page import="it.bz.tiktak.core.Tracking" %>
<%@ page import="it.bz.tiktak.core.Project" %>
<%@ page import="it.bz.tiktak.core.Activity" %>

<script type="text/javascript">
    $(document).ready(function()
    {
      $("#date").datepicker({dateFormat: '${message(code: "jsDateFormat", default: "dd/mm/yy")}', 
                              showButtonPanel: true
//                              ,onClose: function(dateText, inst) {
//                                  var date = $(this).datepicker('getDate');
//                                  $('#date_day').attr("value",date.getDate());
//                                  $('#date_month').attr("value",date.getMonth()+1);
//                                  $('#date_year').attr("value",date.getFullYear());
//                               }
   							   });
    })
</script>

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

    <span id="activity">
	<g:if test="${myTrackingInstance?.project}">	
	  <g:select id="activity" name="activity.id" from="${myTrackingInstance?.project?.activities}" optionKey="id" required="" value="${myTrackingInstance?.activity?.id}" class="many-to-one"/>
	</g:if>
	</span>
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
	<script language="javascript">
	function updateActivity( ) {
		document.getElementById('project').onchange();  
    }
	</script>
	<g:field type="date" name="date" onchange="${remoteFunction(onSuccess:"updateActivity()", action: 'refreshProjects', update: 'project', params:'\'id=\'+document.getElementById(\'project\').value+\'&validOn=\'+this.value+\'&activityId=\'+document.getElementById(\'activity\').value')}"  value="${formatDate(date:myTrackingInstance?.date)}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: myTrackingInstance, field: 'detail', 'error')} ">
	<label for="detail">
		<g:message code="myTracking.detail.label" default="Detail" />		
	</label>
	<g:textArea name="detail" value="${myTrackingInstance?.detail}" rows="2"/>
</div>


