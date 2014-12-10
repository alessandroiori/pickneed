package it.uniroma3.controller;


import it.uniroma3.facade.CommentFacade;
import it.uniroma3.facade.ProjectFacade;
import it.uniroma3.model.Comment;
import it.uniroma3.model.Project;
import it.uniroma3.model.User;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.FacesContext;

@ManagedBean(name="commentController")
public class CommentController {
	
	@EJB(beanName="commentFacade")
	private CommentFacade commentFacade;
	
	@EJB(beanName="projectFacade")
	private ProjectFacade projectFacade;
	
	private String description;
	
	private Comment comment;
	private List<Comment> comments;
	
	private Long id;

	
	public String createComment() {
		FacesContext context = FacesContext.getCurrentInstance();
		User u = (User)context.getExternalContext().getSessionMap().get("user");
		Project p = this.projectFacade.getProject((Long)context.getExternalContext().getSessionMap().get("idProject"));
		this.comment = this.commentFacade.createComment(this.description, u, p);
		this.comments = this.commentFacade.getAllCommentsOf(p);
		return "comments";
	}
	

	 public void setDescription(String d) {
		 this.description = d; 	 
	 }
	 
	 public String getDescription() {
		 return this.description;
	 }
	 
	 public Comment getComment() {
		return comment;
	}
	 
	 public void setComment(Comment comment) {
		this.comment = comment;
	}


	public List<Comment> getComments() {
		return comments;
	}


	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}
	

}
