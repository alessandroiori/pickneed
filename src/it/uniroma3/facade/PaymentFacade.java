package it.uniroma3.facade;

import it.uniroma3.model.Payment;
import it.uniroma3.model.Project;
import it.uniroma3.model.User;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name="paymentFacade")
public class PaymentFacade {
	
	@PersistenceContext(unitName="persistence-unit")
	private EntityManager em;
	
	public Payment createPayment(Float money, User u, Project p) {
		
		Payment payment = new Payment(money, u, p);
		em.persist(payment);
		return payment;
	}
	
	public List<Project> ongoingProjects(User u) {
		List<Project> projects = em.createQuery("SELECT DISTINCT p.project FROM Payment p WHERE p.payingUser= :user AND p.project.ongoing=TRUE", Project.class).setParameter("user", u).getResultList();
		return projects;
	}
	
	public List<User> listPartecipants(Project p) {
		List<User> users = em.createQuery("SELECT DISTINCT p.payingUser FROM Payment p WHERE p.project= :project", User.class).setParameter("project", p).getResultList();
		return users;
	}
}
