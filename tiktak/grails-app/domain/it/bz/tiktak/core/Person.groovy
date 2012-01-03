package it.bz.tiktak.core

import it.bz.tiktak.security.*

class Person extends User {
   
    String lastName
    String firstName

    static constraints = {
    }
	
	def getProjects() {
		ProjectPerson.findAllByPerson(this).project
	}
	
	String toString() { "${this.lastName} ${this.firstName}" }
}
