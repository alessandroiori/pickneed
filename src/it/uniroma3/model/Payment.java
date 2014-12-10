package it.uniroma3.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="payments")
public class Payment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(nullable=false)
	private Float money;
	
	@ManyToOne(cascade = {CascadeType.PERSIST})
	private User payingUser;
	
	@OneToOne
	private Project project;
	
	public Payment() {}
	
	public Payment(Float money, User u, Project p) {
		this.money = money;
		this.payingUser = u;
		this.project = p;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public void setMoney(Float money) {
		this.money = money;
	}
	
	public float getMoney() {
		return money;
	}
	
	public void setPayingUser(User payingUser) {
		this.payingUser = payingUser;
	}
	
	public User getPayingUser() {
		return payingUser;
	}
	
	public void setProject(Project project) {
		this.project = project;
	}
	
	public Project getProject() {
		return project;
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
