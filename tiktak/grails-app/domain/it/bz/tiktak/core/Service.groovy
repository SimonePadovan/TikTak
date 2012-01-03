package it.bz.tiktak.core

import java.util.Date;

class Service {

	String codice
	String descrI
	String descrD
	Date dataFine
	
	static constraints = {
	  codice unique:true
	  descrI blank:false
	  descrD blank:false
	  dataFine nullable:true
	}
	
	String toString() { "${this.descrI}" }
}