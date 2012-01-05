import grails.converters.*
import grails.util.Environment
import it.bz.security.*
import it.bz.tiktak.core.Activity
import it.bz.tiktak.core.Person
import it.bz.tiktak.core.Project
import it.bz.tiktak.core.ProjectPerson
import it.bz.tiktak.core.Service
import it.bz.tiktak.core.Tracking
import it.bz.tiktak.security.Role
import it.bz.tiktak.security.UserRole
import it.bz.timetracker.*

class BootStrap {

    def init = { servletContext ->
	  if (Environment.current == Environment.DEVELOPMENT) {
		  def s1 = new Service(descrI: "Sviluppo nuovo SW", descrD: "Software produktion", codice: "SVIL").save()	
		  def s2 = new Service(descrI: "Manutenzione SW", descrD: "Manutenzione SW", codice: "MANUT").save()
		  def s3 = new Service(descrI: "Gestione economica contratti/licenze", descrD: "Basisbetreuung-Lizenzen - Sonst ", codice: "ECON").save()
		  def s4 = new Service(descrI: "Gestione banche dati", descrD: "Datenbankverwaltung", codice: "DB").save()
		  def s5 = new Service(descrI: "Gestione dati", descrD: "Datenverwaltung", codice: "DATI").save()
		  def s6 = new Service(descrI: "Referenza-Coordinamento", descrD: "Referenz-Koordinierung", codice: "COOR").save()
			
		  def p1 = new Project(descrI: "Sicop", descrD: "Sicop", codice: "SICOP", service: s1).save()
		  def p2 = new Project(descrI: "Manutenztione applicazione x", descrD: "Manutenztione applicazione x", codice: "MANUT_PJX", service: s2).save()
		  def p3 = new Project(descrI: "xxxxx", descrD: "xxxx", codice: "MANUT_PJX", service: s1).save()
	
		  def a1 = new Activity(descrI: "Analisi business", descrD: "Analisi business", service: s1).save()
		  def a3 = new Activity(descrI: "Analisi", descrD: "Analyse", service: s2).save()
		  
		  new Activity(descrI: "Sviuppo", descrD: "Entwicklung", service: s1).save()  
		  new Activity(descrI: "Sviuppo", descrD: "Entwicklung", service: s2).save()
	      new Activity(descrI: "PM", descrD: "PM", service: s1).save()
		  	  	    
		  // Security
		  // Roles
	  	  def adminRole = new Role(authority: 'ROLE_ADMIN', description: 'Administrator').save()
		  def userRole = new Role(authority: 'ROLE_USER', description: 'User').save()
		  
		  // Users
		  def adminUser = new Person(lastName: 'Padovan', firstName:'Simone', username: 'admin', password: 'password',  enabled: true).save()
		  def simpleUser = new Person(lastName: 'Pinco', firstName:'Pallo', username: 'user', password: 'password',  enabled: true).save()
	
		  // UserRoles
		  new UserRole(user:adminUser, role:adminRole).save()
		  new UserRole(user:simpleUser, role:userRole).save()
	  
		  new ProjectPerson(project: p1, person: adminUser).save()
		  new ProjectPerson(project: p2, person: adminUser).save()
		  
		  new ProjectPerson(project: p1, person: simpleUser).save()
		  
		  
		  new Tracking(person: adminUser, date: new Date(), hours: 6, project: p1, activity: a1).save()
		  new Tracking(person: adminUser, date: new Date(), hours: 1, project: p2, activity: a3).save()
		  new Tracking(person: adminUser, date: new Date()-1, hours: 2, project: p2, activity: a3).save()
		  new Tracking(person: adminUser, date: new Date()-2, hours: 4, project: p2, activity: a3).save()
		  
		  new Tracking(person: simpleUser, date: new Date(), hours: 6, project: p1, activity: a1).save()
		  new Tracking(person: simpleUser, date: new Date()-1, hours: 4, project: p1, activity: a1).save()
	  }	  
	  
    }
    def destroy = {
    }
}
