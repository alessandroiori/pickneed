package it.uniroma3.facade;

import it.uniroma3.model.Project;
import it.uniroma3.model.User;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name="projectFacade")
public class ProjectFacade {

	@PersistenceContext(unitName="persistence-unit")
	private EntityManager em;
	
	public Project createProject(String name, Date expirDate, String place, Float edge, String desc, User u) {
		Project p = new Project(name, expirDate, place, edge, desc, u);
		em.persist(p);
		return p;
	}
	
	public void removeProject(Long id) {
		Project p = em.find(Project.class, id);
		em.remove(p);
	}
	
	public Project getProject(Long id) {
		Project p = em.find(Project.class, id);
		return p;
	}
	
	public List<Project> createdProjectsBy(User u) {
		List<Project> projects = em.createQuery("SELECT p FROM Project p WHERE p.userCreator= :user", Project.class).setParameter("user", u).getResultList();
		return projects;
	}
	
	public List<Project> getAllProjects() {
		List<Project> projects = em.createQuery("SELECT p FROM Project p WHERE p.ongoing=TRUE", Project.class).getResultList();
		return projects;
	}
}
