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
		environments {
			development {
			  def s1 = new Service(descrI: "Sviluppo nuovo SW", descrD: "Software produktion", code: "SVIL").save()	
			  def s2 = new Service(descrI: "Manutenzione SW", descrD: "Manutenzione SW", code: "MANUT").save()
			  def s3 = new Service(descrI: "Gestione economica contratti/licenze", descrD: "Basisbetreuung-Lizenzen - Sonst ", code: "ECON").save()
			  def s4 = new Service(descrI: "Gestione banche dati", descrD: "Datenbankverwaltung", code: "DB").save()
			  def s5 = new Service(descrI: "Gestione dati", descrD: "Datenverwaltung", code: "DATI").save()
			  def s6 = new Service(descrI: "Referenza-Coordinamento", descrD: "Referenz-Koordinierung", code: "COOR").save()
				
			  def p1 = new Project(descrI: "Sicop ITA", descrD: "Sicop TED", code: "SICOP", service: s1).save()
			  def p2 = new Project(descrI: "Manutenztione applicazione x", descrD: "Manutenztione applicazione x", code: "MANUT_PJX", service: s2).save()
			  def p3 = new Project(descrI: "xxxxx", descrD: "xxxx", code: "MANUT_PJX", service: s1).save()
			  def p4 = new Project(descrI: "Progetto chiuso", descrD: "Progetto chiuso", code: "CLOSED", endDate:new Date()-1, service: s2).save()
		
			  def a1 = new Activity(descrI: "Analisi business", descrD: "Analisi business", service: s1).save()
			  def a3 = new Activity(descrI: "Analisi", descrD: "Analyse", service: s2).save()
			  def a4 = new Activity(descrI: "Attivitá chiusa", descrD: "Attivitá chiusa", endDate: new Date()-1, service: s2).save()
			  
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
			  new ProjectPerson(project: p4, person: adminUser).save()
			  
			  new ProjectPerson(project: p1, person: simpleUser).save()
			  		  
			  new Tracking(person: adminUser, date: new Date(), hours: 6, project: p1, activity: a1).save()
			  new Tracking(person: adminUser, date: new Date(), hours: 1, project: p2, activity: a3).save()
			  new Tracking(person: adminUser, date: new Date()-1, hours: 2, project: p2, activity: a3).save()
			  new Tracking(person: adminUser, date: new Date()-2, hours: 4, project: p2, activity: a3).save()
			  
			  new Tracking(person: simpleUser, date: new Date(), hours: 6, project: p1, activity: a1).save()
			  new Tracking(person: simpleUser, date: new Date()-1, hours: 4, project: p1, activity: a1).save()		  
		  }
		}		  
	  
    }
    def destroy = {
    }
}
