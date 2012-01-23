package it.bz.tiktak.core

import it.bz.tiktak.security.*

class Person extends User {
   
    String lastName
    String firstName

    static constraints = {
    }

	def getProjects(Date validOn) {
		def projects		 
		if (validOn) {
			projects = ProjectPerson.findAll {
				person == this
				endDate == null || endDate > validOn
		    }.project
			projects = projects.findAll {!it.endDate || it.endDate > validOn}
		}	
		else
			projects = ProjectPerson.findAllByPerson(this).project
		return projects  			  
	}

	def getProjects() {
		return getProjects(null)
	}
		
	String toString() { "${this.lastName} ${this.firstName}" }
}
