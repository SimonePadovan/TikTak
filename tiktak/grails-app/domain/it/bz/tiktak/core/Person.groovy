package it.bz.tiktak.core

import it.bz.tiktak.security.*

class Person extends User {
   
    String lastName
    String firstName

    static constraints = {
    }
	
	def getProjects(Date validOn) {
		def projects = ProjectPerson.findAllByPerson(this).project
		if (validOn)
		   projects.findAll {!it.dataFine || it.dataFine > validOn}
		 return projects  			  
	}

	def getProjects() {
		return getProjects(null)
	}
		
	String toString() { "${this.lastName} ${this.firstName}" }
}
