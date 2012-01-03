package it.bz.tiktak.core

import grails.converters.*
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class MyTrackingController extends BaseController {
	
	def springSecurityService
	
	// Imposto model di BaseController
	def beforeInterceptor = {
		model = Tracking
	}
	
	def getInstanceListKey() {
		'myTrackingInstanceList'
	}
	
	def getInstanceTotalKey() {
		'myTrackingInstanceTotal'
	}

	def getInstanceKey() {
		'myTrackingInstance'
	}	
	
	def doList(params) {
		def user = Person.get(springSecurityService.principal.id)
		if (params.from) {
			def from = params.from
			def to =  params.to			
			if (!from instanceof Date)
			 	from = params.date('from', messageSource.getMessage("dateFormat",null,'dd/MM/yyyy'))
			
			if (to) {
				if (!to instanceof Date)
				   to = params.date('to', messageSource.getMessage("dateFormat",null,'dd/MM/yyyy'))
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

	def doFind(params) {
		def user = Person.get(springSecurityService.principal.id)
		if (user)
			Tracking.findByPersonAndId(user, params.id)
	}

	def newInstance() {
		def instance = super.newInstance()
		
		instance.person = Person.get(springSecurityService.principal.id)
		return instance
	}

	def setProps(instance, p)
	{
		super.setProps(instance, p)
		
		instance.person = Person.get(springSecurityService.principal.id)	
	}


	/****************/
	
		
		
	def refreshActivities()
	{		
		if (params.id) {
  	  	  Project p = Project.get(params.id)
		  render g.select(id:'activityCombo', name:'activity.id', from:p?.getActivities(), optionKey:'id', value:'${myTrackingInstance?.activity?.id}', class:'many-to-one')
		}
		else
		  render ""    
	}
	
	def getFirstDayOfWeek(Date day) {
		day.clearTime()
		return day - day.calendarDate.dayOfWeek + 2 // Monday
	}
	
	def setWeekParams() {
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

