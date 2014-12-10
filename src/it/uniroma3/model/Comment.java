package it.uniroma3.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="comments")
public class Comment {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(nullable=false)
	private String description;
	
	@ManyToOne 
	private User user;
	
	@ManyToOne
	private Project project;
	
	public Comment() {}
	
	public Comment(String description, User u, Project p) {
		this.description = description;
		this.user = u;
		this.project = p;
	}
	
	
	 public void setDescription(String d) {
		 this.description = d; 	 
	 }
	 
	 public String getDescription() {
		 return this.description;
	 }

	 public void setUser(User u) {
		 this.user=u;
	 }
	 
	 public User getUser() {
		 return this.user;
	 }
	 
	 public void setProject(Project p) {
		 this.project = p;
	 }
	 
	 public Project getProject() {
		 return this.project;
	 }
	 
		@Override
		public int hashCode() {
			// TODO Auto-generated method stub
			return super.hashCode();
		}
		
		@Override
		public boolean equals(Object obj) {
			// TODO Auto-generated method stub
			return super.equals(obj);
		}
	 
	 
}
