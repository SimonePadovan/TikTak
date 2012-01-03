package it.bz.tiktak.core

class Project {

	String codice
	String descrI
	String descrD
	Service service
	Date dataFine
	
	static constraints = {
	  codice unique:true 	
	  descrI blank:false
      descrD blank:false
	  service()
	  dataFine nullable:true
	}
	
	def getActivities() {
		Activity.findAllByService(this.service)
	}
	
	String toString() { "${this.descrI}" }
}
