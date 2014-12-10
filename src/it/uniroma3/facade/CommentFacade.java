package it.uniroma3.facade;

import java.util.List;

import it.uniroma3.model.Comment;
import it.uniroma3.model.Project;
import it.uniroma3.model.User;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless(name="commentFacade")
public class CommentFacade {
	
	@PersistenceContext(unitName="persistence-unit")
	private EntityManager em;
	
	
	public Comment createComment(String d, User u, Project p) {	
		Comment comment = new Comment(d, u, p);
		em.persist(comment);
		return comment;
	}
	
	public List<Comment> getAllCommentsOf(Project p) {
		List<Comment> comments = (List<Comment>) em.createQuery("SELECT c FROM Comment c WHERE c.project = :project", Comment.class).setParameter("project", p).getResultList();
		return comments;
		
	}

}
