package it.bz.tiktak.core

class Tracking {

	static final double MAX_HOURS_PER_DAY = 12d

	Date date
	double hours
	Project project
	Activity activity
	Person person
	String detail

	static constraints = {
		project validator: { value, self ->
			boolean valid = true			
			if (value.dataFine && value.dataFine <= self.date)
    		   valid = false

			return valid
		}
		activity validator: { value, self ->
			boolean valid = true			
			if (value.dataFine && value.dataFine <= self.date)
    		   valid = false

			return valid
		}
		hours min:0.15d, max:MAX_HOURS_PER_DAY, validator: { value, self ->
			boolean valid = true
			
			def totHoursDay = Tracking.executeQuery("select sum(e.hours) from Tracking as e where e.date = :date and e.person = :person", [date: self.date?.clearTime(), person: self.person])
			if (totHoursDay[0] != null) {
				def total = totHoursDay[0]
				if (self.getPersistentValue('hours'))
				  total -= self.getPersistentValue('hours')
				total += value
				if (total > MAX_HOURS_PER_DAY)
					valid = false
			}
			return valid
		}
		date()
		detail nullable:true
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