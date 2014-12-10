package it.uniroma3.controller;

import it.uniroma3.facade.CommentFacade;
import it.uniroma3.facade.PaymentFacade;
import it.uniroma3.facade.ProjectFacade;
import it.uniroma3.model.Comment;
import it.uniroma3.model.Project;
import it.uniroma3.model.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.FacesContext;

@ManagedBean(name="projectController")
public class ProjectController {

	@EJB(beanName="projectFacade")
	private ProjectFacade projectFacade;
	
	@EJB(beanName="paymentFacade")
	private PaymentFacade paymentFacade;
	
	@EJB(beanName="commentFacade")
	private CommentFacade commentFacade;
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	
	private String name;
	private Date expirationDate;
	private String place;
	private Float edge;
	private String description;
	private User user;
	private Project project;
	private List<Project> projects;
	private List<User> users;
	private List<Comment> comments;
	
	public String createProject() {
		FacesContext context = FacesContext.getCurrentInstance();
		this.user = (User)context.getExternalContext().getSessionMap().get("user");
		this.project = this.projectFacade.createProject(name, expirationDate, place, edge, description, user);
		context.getExternalContext().getSessionMap().put("idProject", this.project.getId());
		this.comments = new ArrayList<Comment>();
		return "project";
	}
	
	public String removeProject() {
		this.projectFacade.removeProject((Long)FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("idProject"));
		return "home";
	}
	
	public String getProjectForID() {
		this.project = this.projectFacade.getProject(id);
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("idProject", id);
		this.setComments(this.commentFacade.getAllCommentsOf(this.project));
		return "project";
	}
	
	public String createdProjectsBy() {
		this.user = (User)FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("user");
		this.projects = this.projectFacade.createdProjectsBy(user);
		return "projects";	
	}
	
	public String ongoingProjects() {
		this.user = (User)FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("user");
		this.projects = paymentFacade.ongoingProjects(user);
		return "projects";
	}
	
	public String listProjects() {
		this.projects = this.projectFacade.getAllProjects();
		return "projects";
	}
	
	public String listPartecipants() {
		FacesContext context = FacesContext.getCurrentInstance();
		Project p = this.projectFacade.getProject((Long)context.getExternalContext().getSessionMap().get("idProject"));
		this.setUsers(this.paymentFacade.listPartecipants(p));
		return "users";
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getExpirationDate() {
		return expirationDate;
	}
	
	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}
	
	public String getPlace() {
		return place;
	}
	
	public void setPlace(String place) {
		this.place = place;
	}
	
	public Float getEdge() {
		return edge;
	}
	
	public void setEdge(Float edge) {
		this.edge = edge;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public Project getProject() {
		return project;
	}
	
	public void setProject(Project project) {
		this.project = project;
	}
	
	public List<Project> getProjects() {
		return projects;
	}
	
	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
}
