package it.bz.tiktak.core

class ProjectPerson {

    Project project
    Person person    
	Date endDate

    static constraints = {
		endDate nullable: true
    }

}
