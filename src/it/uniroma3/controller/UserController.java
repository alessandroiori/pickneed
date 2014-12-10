package it.uniroma3.controller;

import it.uniroma3.facade.UserFacade;
import it.uniroma3.model.User;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.FacesContext;

@ManagedBean(name="userController")
public class UserController {

	@EJB(beanName="userFacade")
	private UserFacade userFacade;
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	
	private String name;
	private String lastname;
	private String email;
	private String password;
	private User user;
	private String loginError;
	private String signupError;

	public String createUser() {
		try{
			this.user = this.userFacade.createUser(name, lastname, email, password);
			FacesContext context = FacesContext.getCurrentInstance();
			context.getExternalContext().getSessionMap().put("user", this.user);
			return "home";
		}
		catch(Exception e) {
			this.setSignupError("Email is not valid");
		}
		return "index";
	}

	public String loginUser() {
		try {
			this.user = this.userFacade.getUser(email);
			if(this.userFacade.checkPW(user, password)) {
				FacesContext context = FacesContext.getCurrentInstance();
				context.getExternalContext().getSessionMap().put("user", this.user);
				return "home";
			}
			this.setLoginError("Wrong password or email");
		}
		catch(Exception e) {
			this.setLoginError("Wrong password or email");
		}
		return "index";
	}
	
	public String logoutUser() {
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("user");
		return "index.html";
	}

	public String getUserForID() {
		this.user = this.userFacade.getUser(id);
		return "user";
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

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getLoginError() {
		return loginError;
	}

	public void setLoginError(String loginError) {
		this.loginError = loginError;
	}

	public String getSignupError() {
		return signupError;
	}

	public void setSignupError(String signupError) {
		this.signupError = signupError;
	}
}
