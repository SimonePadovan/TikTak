package it.bz.tiktak.core

import grails.converters.*
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class PersonController {

	def showProjects() {
		if(params.id && Person.exists(params.id)){
			Date validOn
			if (params.validOn)
				validOn = params.date('validOn', message(code: "default.date.format", default: 'dd/MM/yyyy'))
			
			def retvalue = Person.findById(params.id)?.getProjects(validOn)
				
			withFormat {
				html { [personProjects : retvalue] }
				xml { render retvalue as XML }
				json { render retvalue as JSON }
			}
		}
	}

	def showTrackings() {
		if(params.id && Person.exists(params.id)){
			def person = Person.findById(params.id)

			def retvalue
			if (params.from) {
				def from = params.date('from', message(code: "default.date.format", default: 'dd/MM/yyyy'))
				def to = params.date('to', message(code: "default.date.format", default: 'dd/MM/yyyy'))
				if (to)
					retvalue = Tracking.findAllByPersonAndDateBetween(person, from, to)
				else
					retvalue = Tracking.findAllByPersonAndDateGreaterThan(person, from)
			}
			else
				retvalue = Tracking.findAllByPerson(person)

			withFormat {
				html { [personTrackings : retvalue] }
				xml { render retvalue as XML }
				json { render retvalue as JSON }
			}
		}
	}

	def show = {
		def retvalue
		if (params.controller2)
		   if (params.controller2.equals('project'))
			  retvalue = showProjects()
		   else  
  		      retvalue = showTrackings()
		else {
			if(params.id && Person.exists(params.id))
				retvalue = Person.findById(params.id)
			else
				retvalue = Person.list()

			withFormat {
				html { [personInstance: retvalue] }
				xml { render retvalue as XML }
				json { render retvalue as JSON }
			}
		}	
	}	
}

