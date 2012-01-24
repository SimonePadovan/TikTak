package it.bz.tiktak.core

import java.util.Date;

class Service {

	String code
	String descrI
	String descrD
	Date endDate
	
	static constraints = {
	  code unique:true, maxSize: 15
	  descrI blank:false, maxSize: 200
	  descrD blank:false, maxSize: 200
	  endDate nullable:true
	}
	
	String toString() { "${this.descrI}" }
}