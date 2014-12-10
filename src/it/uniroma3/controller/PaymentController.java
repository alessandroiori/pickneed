package it.uniroma3.controller;

import it.uniroma3.facade.PaymentFacade;
import it.uniroma3.facade.PiggyBankFacade;
import it.uniroma3.facade.ProjectFacade;
import it.uniroma3.model.Payment;
import it.uniroma3.model.Project;
import it.uniroma3.model.User;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

@ManagedBean(name="paymentController")
public class PaymentController {
	
	@EJB(beanName="paymentFacade")
	private PaymentFacade paymentFacade;
	
	@EJB(beanName="projectFacade")
	private ProjectFacade projectFacade;
	
	@EJB(beanName="piggyBankFacade")
	private PiggyBankFacade piggyBankFacade;
	
	private User payingUser;
	private Project project;
	private Float money;
	private Payment payment;
	private String paymentCommitted;
	
	public String createPayment() {
		FacesContext context = FacesContext.getCurrentInstance();
		this.payingUser = (User)context.getExternalContext().getSessionMap().get("user");
		this.project = this.projectFacade.getProject((Long)context.getExternalContext().getSessionMap().get("idProject"));
		this.payment = this.paymentFacade.createPayment(money, payingUser, project);
		this.addPayment();
		this.paymentCommitted = "Payment Committed!";
		context.getExternalContext().getSessionMap().remove("idProject");
		return "payment";
	}
	
	private void addPayment() {
		this.piggyBankFacade.addPayment(this.payment);
	}
	
	public User getPayingUser() {
		return payingUser;
	}
	
	public void setPayingUser(User payingUser) {
		this.payingUser = payingUser;
	}
	
	public Float getMoney() {
		return money;
	}
	
	public void setMoney(Float money) {
		this.money = money;
	}
	
	public Payment getPayment() {
		return payment;
	}
	
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	
	public String getPaymentCommitted() {
		return paymentCommitted;
	}
	
	public void setPaymentCommitted(String paymentCommitted) {
		this.paymentCommitted = paymentCommitted;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
}
