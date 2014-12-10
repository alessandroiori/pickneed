package it.uniroma3.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(nullable=false)
	private String name;
	
	@Column(nullable=false)
	private String lastname;
	
	@Column(nullable=false, unique=true)
	private String email;
	
	@Column(nullable=false)
	private String password;
	
	@OneToMany(mappedBy="userCreator")  //forse va messo cascade remove
	private List<Project> createdProject;
	
	@OneToMany(mappedBy="payingUser")  //forse cascade remove
	private List<Payment> payments;
	
	@OneToMany(mappedBy="user", cascade= {CascadeType.REMOVE})
	private List<Comment> comments;
	
	public User() {}
	
	public User(String name, String lastname, String email, String password) {
		this.name = name;
		this.lastname = lastname;
		this.email = email;
		this.password = password;
		this.createdProject = new ArrayList<Project>();
		this.comments = new ArrayList<Comment>();
		this.payments = new ArrayList<Payment>();
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setLastname(String lastname) {
	this.lastname = lastname;
	}
	
	public String getLastname() {
		return lastname;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setCreatedProject(List<Project> createdProject) {
		this.createdProject = createdProject;
	}
	
	public List<Project> getCreatedProject() {
		return createdProject;
	}
	
	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}
	
	public List<Payment> getPayments() {
		return payments;
	}
	
	public void addPayment(Payment p) {
		this.payments.add(p);
	}
	
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
	public List<Comment> getComments() {
		return comments;
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
