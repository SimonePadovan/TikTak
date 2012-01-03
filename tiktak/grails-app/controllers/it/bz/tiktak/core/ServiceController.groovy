package it.bz.tiktak.core

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class ServiceController extends BaseController {
	
	// Imposto model di BaseController
    def beforeInterceptor = {
		model = Service
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
