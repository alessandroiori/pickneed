package it.uniroma3.facade;

import it.uniroma3.model.Payment;
import it.uniroma3.model.PiggyBank;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name="piggyBankFacade")
public class PiggyBankFacade {
	
	@PersistenceContext(unitName="persistence-unit")
	private EntityManager em;
	
	public void addPayment(Payment p) {
		PiggyBank pb = em.find(PiggyBank.class, p.getProject().getPiggybank().getId());
		pb.setCurrentAmount(pb.getCurrentAmount()+p.getMoney());
	}
	
	public PiggyBank getPiggyBank(Long id) {
		PiggyBank pb = em.find(PiggyBank.class, id);
		return pb;
	}
}
