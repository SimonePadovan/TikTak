package it.bz.tiktak.core

import grails.converters.*

// vedi https://github.com/swfinch1277/Spring-Minutes/blob/master/grails-app/controllers/com/springminutes/example/CowController.groovy
abstract class BaseController {
	
	static allowedMethods = [save: "POST", update: ['POST', 'PUT'], delete: ['POST', 'DELETE']]

	def model
	
	protected def getDefaultDateFormat() {
	  message(code: "default.date.format", default: 'dd/MM/yyyy')
	}  
	 
	protected def getModelName() {
		model.metaClass.theClass.toString().tokenize('.').last()
	}
	
	protected def uncapitalize (String value) {
		value[0].toLowerCase() + value.substring(1)
	}
  
	protected def getModelLabel() {
		uncapitalize(getModelName()) + '.label'
	}	

	protected def getModelXmlKey() {
		uncapitalize(getModelName())
	}
	
	protected def getInstanceListKey() {
		uncapitalize(getModelName()) + 'InstanceList'
	}
	
	protected def getInstanceTotalKey() {
		uncapitalize(getModelName()) + 'InstanceTotal'
	}

	protected def getInstanceKey() {
		uncapitalize(getModelName()) + 'Instance'
	}

	
	def index() {
		redirect(action: "list", params: params)
	}
	
	protected def doList(params) {
		model.list(params)
	}

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)				
		def retvalue = doList(params)

		withFormat {
			html {[(getInstanceListKey()): retvalue, (getInstanceTotalKey()): model.count()]}
			xml { render retvalue as XML }
			json { render retvalue as JSON }
		}
	}

	protected def doFind(params) {
		model.findById(params.id)
	}	
	
	def show() {
		def retvalue
		if(params.id && model.exists(params.id)){
			retvalue = doFind(params)
		}
		if (retvalue) {
			withFormat {
				html { [(getInstanceKey()): retvalue] }
				xml { render retvalue as XML }
				json { render retvalue as JSON }
			}
		}
	}

	def edit() {
		def instance = model.get(params.id)
		if (!instance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: getModelLabel(), default: getModelName()),
				params.id
			])
			redirect(action: "list")
			return
		}

		[(getInstanceKey()): instance]
	}

	protected def newInstance()
	{
		model.newInstance(request.format == 'xml' ? params[getModelXmlKey()] : params)
	}
		
	def create() {
		[(getInstanceKey()): newInstance()]
	}

	def save() {
		def retvalue
		def instance = newInstance()

		if (instance.save(flush: true)) {
			if (request.format == 'form') {
				flash.message = "${message(code: 'default.created.message', args: [message(code: getModelLabel(), default: getModelName()), instance.id])}"
				redirect(action: "list", id: instance.id)
			}
			else {
				retvalue = instance
				response.status = 201 // New Resource created
			}
		}
		else {
			if (request.format == 'form') {
				render(view: "create", model: [(getInstanceKey()): instance])
				return
			}
			else {
				response.status = 400 // Bad Request
				retvalue = instance.errors.allErrors
			}
		}
		withFormat {
			xml { render retvalue as XML }
			json { render retvalue as JSON }
		}
	}

	protected def renderNotFound = {
		html {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: getModelLabel(), default: getModelName()), params.id])}"
			redirect(action: "list")
		}
		form {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: getModelLabel(), default: getModelName()), params.id])}"
			redirect(action: "list")
		}
		xml {
			response.status = 404
			render getModelName() + " ${params.id} not found."
		}
		json {
			response.status = 404
			render getModelName() + " ${params.id} not found."
		}
	}

	def delete() {
		if (!params.id) {
			withFormat renderNotFound
			return
		}
		def instance = doFind(params)
		if (instance) {
			try {
				instance.delete(flush: true)
				def message = "${message(code: 'default.deleted.message', args: [message(code: getModelLabel(), default: getModelName()), params.id])}"				
				
				if (request.format == 'form') {
					flash.message = message
					redirect(action: "list")
				}
				else {
					response.status = 200 // OK
					render message
				}
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				if (request.format == 'form') {
					flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: getModelLabel(), default: getModelName()), params.id])}"
					redirect(action: "show", id: params.id)
				}
				else {
					response.status = 409 // Conflict
					withFormat {
						xml { render instance.errors as XML }
						json { render instance.errors as JSON }
					}
				}
			}
		}
		else {
			withFormat renderNotFound
		}
	}

	protected void setProps(instance, p)
	{
		instance.properties = p
	}
	
	def update() {
		if (!params.id) {
			withFormat renderNotFound
			return
		}
		def p = (request.format == 'xml' ? params[getModelXmlKey()] : params)
		def instance = doFind(params)
		if (instance) {
			if (p.version) {
				def version = p.version.toLong()
				if (instance.version > version) {
					instance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: getModelLabel(), default: getModelName())]
					as Object[], "Another user has updated this Tracking while you were editing")

					withFormat {
						html {
							render(view: "edit", model: [(getInstanceKey()): instance])
						}
						xml {
							response.status = 409 // Conflict
							render instance.errors.allErrors as XML
						}
						json {
							response.status = 409 // Conflict
							render instance.errors.allErrors as JSON
						}
					}
					return
				}
			}
			setProps(instance, p)
			if (!instance.hasErrors() && instance.save(flush: true)) {
				withFormat {
					html {
						flash.message = "${message(code: 'default.updated.message', args: [message(code: getModelLabel(), default: getModelName()), instance.id])}"
						redirect(action: "list", id: instance.id)
					}
					xml { render instance as XML }
					json { render instance as JSON }
				}
			}
			else {
				withFormat {
					html {
						render(view: "edit", model: [(getInstanceKey()): instance])
					}
					xml {
						response.status = 409 // Conflict
						render instance.errors.allErrors as XML
					}
					json {
						response.status = 409 // Conflict
						render instance.errors.allErrors as JSON
					}
				}
			}
		}
		else {
			withFormat renderNotFound
		}
	}	
}
