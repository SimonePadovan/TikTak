package it.bz.tiktak.core

class Project {

	String code
	String descrI
	String descrD
	Service service
	Date endDate
	
	static constraints = {
	  code unique:true 	
	  descrI blank:false
      descrD blank:false
	  service()
	  endDate nullable:true
	}
	
	def getActivities(Date validOn) {
		def activities = Activity.findAllByService(this.service)				
		if (validOn)
		    activities = activities.findAll {!it.endDate || it.endDate > validOn}
		
		return activities
	}
	
	def getActivities() {
		return getActivities(null)
	}

	String toString() { "${this.descrI}" }
}
