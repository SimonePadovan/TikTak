package it.bz.tiktak.core

import it.bz.organization.core.Person

class ProjectPerson {

    Project project
    Person person    
	Date endDate

    static constraints = {
		endDate nullable: true
    }

}
