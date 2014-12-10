package it.uniroma3.facade;

import it.uniroma3.model.User;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name="userFacade")
public class UserFacade {
	
	@PersistenceContext(unitName="persistence-unit")
	private EntityManager em;

	public User createUser(String name, String lastname, String email, String password) {
		User user = new User(name, lastname, email, password);
		em.persist(user);
		return user;
	}
	
	public User getUser(Long id) {
		User user = em.find(User.class, id);
		return user;
	}
	
	public User getUser(String email) {
		User user = (User) em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class).setParameter("email", email).getSingleResult();
		return user;
	}

	public void updateUser(User user) {
        em.merge(user);
	}
	
    private void deleteUser(User user) {
        em.remove(user);
    }

	public void deleteUser(String id) {
		User user = em.find(User.class, id);
        deleteUser(user);
	}
	
	public boolean checkPW(User u, String password) {
			return u.getPassword().equals(password);
	}
}
