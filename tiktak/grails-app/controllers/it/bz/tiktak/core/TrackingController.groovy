package it.bz.tiktak.core

import grails.converters.*
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class TrackingController extends BaseController {

	// Imposto model di BaseController
	def beforeInterceptor = {
		model = Tracking
	}

	protected def doList(params) {
		if (params.from) {
			def from = params.from
			def to =  params.to
			
			if (!from instanceof Date)
			 	from = params.date('from', getDefaultDateFormat())

			if (to) {
				if  (!to instanceof Date)
				  to = params.date('to', getDefaultDateFormat())
				Tracking.findAllByDateBetween(from, to, params)
			}	
			else
				Tracking.findAllByDateGreaterThan(from, params)
		}
		else
		  super.doList(params)
	}
}
