package it.uniroma3.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="projects")
public class Project {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(nullable=false)
	private String name;
	
	
	private String creationDate;
	
	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date expirationDate;
	
	private String description;
	
	@Column(nullable=false)
	private String place;
	
	private boolean ongoing;
	
	@ManyToOne(cascade = {CascadeType.PERSIST})
	private User userCreator;
	
	@OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private PiggyBank piggybank;
	
	@OneToMany(mappedBy="project", cascade= {CascadeType.REMOVE})
	private List<Comment> comments;
	
	
	public Project() {}
	
	//creationDate da gestire
	public Project(String name, Date expirationDate, String place, Float edge, String desc, User u) {
		this.name = name;
		this.expirationDate = expirationDate;
		this.place = place;
		this.userCreator = u;
		this.description = desc;
		this.ongoing = true;
		this.comments = new ArrayList<Comment>();
		this.piggybank = new PiggyBank(edge);
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
	
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	
	public String getCreationDate() {
		return creationDate;
	}
	
	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}
	
	public Date getExpirationDate() {
		return expirationDate;
	}
	
	public void setPlace(String place) {
		this.place = place;
	}
	
	public String getPlace() {
		return place;
	}
	
	public void setUserCreator(User userCreator) {
		this.userCreator = userCreator;
	}
	
	public User getUserCreator() {
		return userCreator;
	}
	
	public void setPiggybank(PiggyBank piggybank) {
		this.piggybank = piggybank;
	}
	
	public PiggyBank getPiggybank() {
		return piggybank;
	}
	
	public void setOngoing(boolean ongoing) {
		this.ongoing = ongoing;
	}
	
	public boolean getOngoing() {
		return this.ongoing;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
	
	public List<Comment> getComments() {
		return comments;
	}
	
	public void setComments(List<Comment> comments) {
		this.comments = comments;
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
