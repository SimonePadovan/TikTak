package it.bz.tiktak.core

import grails.converters.*
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class ProjectController extends BaseController {
	// Imposto model di BaseController
    def beforeInterceptor = {
		model = Project
	}	

	def showActivities() {
		if(params.id && Project.exists(params.id)){
			Date validOn
			if (params.validOn)
				validOn = params.date('validOn', message(code: "dateFormat", default: 'dd/MM/yyyy')) 
				
			def retvalue = Project.findById(params.id)?.getActivities(validOn)
 
			withFormat {
				xml { render retvalue as XML }
				json { render retvalue as JSON }
			}
		}
	}

	def show() {
		if (params.controller2?.equals('activity'))
		  showActivities()
		else
		  super.show()
	}
	
	@Secured('ROLE_ADMIN')
	def edit() {
		super.edit()
	}
	
	@Secured('ROLE_ADMIN')
	def create() {
		super.create()
	}

	@Secured('ROLE_ADMIN')
	def save() {
		super.save()
	}

	@Secured('ROLE_ADMIN')
	def delete() {
		super.delete()
	}
	
}
