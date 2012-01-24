package it.bz.tiktak.core

import java.util.Date;

class Activity {

	String descrI
	String descrD
	Service service
	Date endDate
	
	static constraints = {	
	  descrI blank:false, maxSize: 200
      descrD blank:false, maxSize: 200
	  service ()
	  endDate nullable:true
	}
		
	String toString() { "${this.descrI}" }
}
