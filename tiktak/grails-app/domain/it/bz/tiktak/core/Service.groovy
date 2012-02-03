package it.bz.tiktak.core

import java.util.Date;

class Service {

	String code
	String descrI
	String descrD
	Date endDate
	
	static hasMany = [ projects: Project, activities: Activity]
	
	static constraints = {
	  code unique:true, maxSize: 15, blank:false
	  descrI blank:false, maxSize: 200
	  descrD blank:false, maxSize: 200
	  endDate nullable:true
	}
	
	String toString() { "${this.descrI}" }
}