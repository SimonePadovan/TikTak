package it.bz.tiktak.core

class Tracking {

	static final double MAX_HOURS_PER_DAY = 12d

	Date date = new Date().clearTime()
	double hours
	Project project
	Activity activity
	Person person
	String detail

	static constraints = {
		project share:"open", validator: { value, self ->		
  		    if (!self.person?.getProjects(self.date)?.contains(value))  
			    return 'validator.notboundtoperson'
		}
		activity share:"open", validator: { value, self ->
			if (!self.id) {  // Solo in caso di inserimento	
			  if (!self.project?.getActivities()?.contains(value))  
			    return 'validator.notboundtoproject'
			}	
		}
		hours min:0.15d, max:MAX_HOURS_PER_DAY, validator: { value, self ->
			boolean valid = true
			
			def tCriteria = Tracking.createCriteria()
			def totHoursDay = tCriteria.list() {
				and {
					eq("person", self.person)
					eq("date", self.date?.clearTime())
				}
				projections {
					sum('hours')
				}
			}			
			//def totHoursDay = Tracking.executeQuery("select sum(e.hours) from Tracking as e where e.date = :date and e.person = :person", [date: self.date?.clearTime(), person: self.person])
			if (totHoursDay[0] != null) {
				def total = totHoursDay[0]
				if (self.getPersistentValue('hours'))
				  total -= self.getPersistentValue('hours')
				total += value
				if (total > MAX_HOURS_PER_DAY)
					valid = false
			}
			if (!valid)
			  return ['validator.error', MAX_HOURS_PER_DAY]
  		    return true  
		}
		date()
		detail nullable:true, maxSize: 1000
	}

	static mapping = {
		project fetch: 'join'
		activity fetch: 'join'
		sort date: "desc" 
	}

	def beforeValidate = {
		date = date?.clearTime()
	}

	String toString() {
		"${this.person}:${this.project}:${this.activity}"
	}
}