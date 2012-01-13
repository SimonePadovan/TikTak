package it.bz.tiktak.core

import grails.converters.*
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class PersonController {

	def showProjects() {
		if(params.id && Person.exists(params.id)){
			def retvalue = Person.findById(params.id)?.getProjects()
			
			if (params.validOn) {
			  Date validOn = params.date('validOn', messageSource.getMessage("dateFormat",null,'dd/MM/yyyy'))			
			  if (validOn)			
			    retvalue = retvalue.findAll {!it.dataFine || it.dataFine > validOn}      
			}
				
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
				def from = params.date('from', 'ddmmyyyy')
				def to = params.date('to', 'ddmmyyyy')
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

