package it.bz.tiktak.core

import it.bz.organization.core.Person
import grails.converters.*
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class MyTrackingController extends BaseController {
	
	def springSecurityService
	
	// Imposto model di BaseController
	def beforeInterceptor = {
		model = Tracking
	}
	
	protected def getInstanceListKey() {
		'myTrackingInstanceList'
	}
	
	protected def getInstanceTotalKey() {
		'myTrackingInstanceTotal'
	}

	protected def getInstanceKey() {
		'myTrackingInstance'
	}	
	
	protected def doList(params) {
		def user = Person.get(springSecurityService.principal.id)
		
		if (params.from) {
			def from = params.from
			def to =  params.to
			if (!from instanceof Date)
			 	from = params.date('from', getDefaultDateFormat())
			
			if (to) {
				if (!to instanceof Date)
				   to = params.date('to', getDefaultDateFormat())
				Tracking.findAllByPersonAndDateBetween(user, from, to, params)
			}	
			else 
				Tracking.findAllByPersonAndDateGreaterThan(user, from, params)
		}
		else
			Tracking.findAllByPerson(user, params)
			
			
	}
		
	def list() {
		withFormat {
			html { setWeekParams() }
			xml { }
			json { }
		}	
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def retvalue = doList(params)

		withFormat {
			html {[(getInstanceListKey()):retvalue]}
			xml { render retvalue as XML }
			json { render retvalue as JSON }
		}
	}

	protected def doFind(params) {
		def user = Person.get(springSecurityService.principal.id)
		if (user)
			Tracking.findByPersonAndId(user, params.id)
	}

	protected def newInstance() {
		def instance = super.newInstance()
		
		instance.person = Person.get(springSecurityService.principal.id)
		return instance
	}

	protected void setProps(instance, p)
	{
		super.setProps(instance, p)
		
		instance.person = Person.get(springSecurityService.principal.id)	
	}


	/****************/
	
		
		
	def refreshActivities()
	{		
		if (params.id) {
  	  	  Project p = Project.get(params.id)
		  Date validOn	
		  if (params.validOn) {
			  validOn = params.date('validOn', getDefaultDateFormat())
		  }
			  
		  render g.select(id:'activity', name:'activity.id', from:p?.getActivities(validOn), optionKey:'id', value:params.activityId, class:'many-to-one')
		}
		else
		  render ""    
	}

	def refreshProjects()
	{
		def user = Person.get(springSecurityService.principal.id)
		if (user) {
		  Date validOn
		  if (params.validOn) {
			  validOn = params.date('validOn', getDefaultDateFormat())
		  }
		  
		  render g.select(id:'project', name:'project.id', from:user?.getProjects(validOn), optionKey:'id', noSelection:['':'Select one...'], value:params.id, class:'many-to-one')
		}
		else
		  render ""
	}
		
	private def getFirstDayOfWeek(Date day) {
		day.clearTime()
		return day - day.calendarDate.dayOfWeek + 2 // Monday
	}
	
	private def setWeekParams() {
		if (params.id) {
			Tracking instance = Tracking.get(params.id)
			if (instance)
				params.from = getFirstDayOfWeek(new Date(instance.date.getTime()))
		}		
		params.max = 100
		session.from = params.from?:session.from?:getFirstDayOfWeek(new Date())
		params.from = session.from
		params.to = params.from + 6
	}

	def nextWeek() {
		Date d = session.from?:getFirstDayOfWeek(new Date())
		params.from = d + 7
		
		render (view: "list", model: list())
	}

	def currentWeek() {
		params.from = getFirstDayOfWeek(new Date())
		
		render (view: "list", model: list())
	}

	def previousWeek() {
		Date d = session.from?:getFirstDayOfWeek(new Date())
		params.from = d - 7
		
		render (view: "list", model: list())
	}

}

