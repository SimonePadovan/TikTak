package it.bz.tiktak.core

import java.util.Date;

class Activity {

	String descrI
	String descrD
	Date dataFine
	Service service
	
	static constraints = {	
	  descrI blank:false
      descrD blank:false
 	  service()
	  dataFine nullable:true
	}
		
	String toString() { "${this.descrI}" }
}
