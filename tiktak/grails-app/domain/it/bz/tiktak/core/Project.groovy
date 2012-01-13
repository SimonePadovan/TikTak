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
	
	def getActivities(Date validOn) {
		def activities = Activity.findAllByService(this.service)		
		if (validOn)
		    activities = activities.findAll {!it.dataFine || it.dataFine > validOn}
		
		return activities
	}
	
	def getActivities() {
		return getActivities(null)
	}

	String toString() { "${this.descrI}" }
}
