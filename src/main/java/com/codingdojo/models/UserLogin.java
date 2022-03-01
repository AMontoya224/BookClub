package com.codingdojo.models;

import javax.validation.constraints.NotEmpty;

public class UserLogin {
	@NotEmpty(message="El correo es requerido")
	private String emailLogin;
	
	@NotEmpty(message="La contraseña es requerida")
	private String passwordLogin;
	
	public UserLogin() {
	}
	
	public UserLogin( String emailLogin, String passwordLogin) {
		this.emailLogin = emailLogin;
		this.passwordLogin = passwordLogin;
	}

	public String getEmailLogin() {
		return emailLogin;
	}

	public void setEmailLogin(String emailLogin) {
		this.emailLogin = emailLogin;
	}

	public String getPasswordLogin() {
		return passwordLogin;
	}

	public void setPasswordLogin(String passwordLogin) {
		this.passwordLogin = passwordLogin;
	}
	
}
