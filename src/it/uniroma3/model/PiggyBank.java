package it.uniroma3.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="piggybanks")
public class PiggyBank {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(nullable=false)
	private Float edge;
	
	@Column(nullable=false)
	private Float currentAmount;
	
//	//vedere se è opportuno fare la cascade sui payments
//	@OneToMany
//	@JoinColumn(name="piggybank_id")
//	private List<Payment> payments;
	
	
	public PiggyBank() {}
	
	public PiggyBank(Float edge) {
		this.currentAmount = new Float(0);
		this.edge = edge;
//		this.payments = new ArrayList<>();
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public void setCurrentAmount(Float currentAmount) {
		this.currentAmount = currentAmount;
	}
	
	public Float getCurrentAmount() {
		return currentAmount;
	}
	
	public void setEdge(Float edge) {
		this.edge = edge;
	}
	
	public Float getEdge() {
		return edge;
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
