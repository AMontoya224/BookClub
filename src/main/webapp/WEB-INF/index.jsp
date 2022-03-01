<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>
			Read Share
		</title>
		<link rel="stylesheet" type="text/css" href="/css/style2.css">
		<script type="text/javascript" src="js/app2.js"></script>
	</head>
	<body>
		<header>
			<div>
				<h1>
					Book Club
				</h1>
				<h3>
					A place for friends to share thoughts on books
				</h3>
			</div>
		</header>
		<main>
			<div class="container">
				<h1>
					Register
				</h1>
				<form:form method="POST" action="/register" modelAttribute="newUser">
					<div class="justify">
						<form:label path="name" for="name" class="inp">
							<form:input path="name" type="text" class="inp-input" name="name" id="name" placeholder=" " />
					    	<span class="inp-label">Name</span>
					  		<span class="inp-focus"></span>
					  		<form:errors path="name" class="error"/>
						</form:label>
					</div>
					<div class="justify">
						<form:label path="email" for="email" class="inp">
							<form:input path="email" type="text" class="inp-input" name="email" id="email" placeholder=" " />
					    	<span class="inp-label">Email</span>
					  		<span class="inp-focus"></span>
					  		<form:errors path="email" class="error"/>
					  		<p class="error">
					  			<c:out value="${emailError}"/>
					  		</p>
						</form:label>
					</div>
					<div class="justify">
						<form:label path="password" for="password" class="inp">
							<div class="row">
								<form:input path="password" type="password" class="inp-input" name="password" id="password" placeholder=" " />
						    	<span class="inp-label inp-label-P">Password</span>
						  		<span class="inp-focus"></span>
					  			<input type="checkbox" class="checkbox" onclick="password_toggle(this)">
					  		</div>
					  		<form:errors path="password" class="error"/>
						</form:label>
					</div>
					<div class="justify">
						<form:label path="confirm" for="confirm" class="inp">
							<div class="row">
								<form:input path="confirm" type="password" class="inp-input" name="confirm" id="confirm" placeholder=" " />
						    	<span class="inp-label inp-label-P">Confirm Password</span>
						  		<span class="inp-focus"></span>
					  			<input type="checkbox" class="checkbox" onclick="password_toggle(this)">
					  		</div>
					  		<p class="error">
					  			<c:out value="${confirmError}"/>
					  		</p>
						</form:label>
					</div>
					<button type="submit" class="submit" >
						Submit
					</button>
				</form:form>
			</div>
			<div class="container-1">
			
			</div>
			<div class="container">
				<h1>
					Login
				</h1>
				<form:form method="POST" action="/login" modelAttribute="newLogin">
					<div class="justify">
						<form:label path="emailLogin" for="emailLogin" class="inp">
							<form:input path="emailLogin" type="text" class="inp-input" name="emailLogin" id="emailLogin" placeholder=" " />
					    	<span class="inp-label">Email</span>
					  		<span class="inp-focus"></span>
					  		<form:errors path="emailLogin" class="error"/>
						</form:label>
					</div>
					<div class="justify">
						<form:label path="passwordLogin" for="passwordLogin" class="inp">
							<div class="row">
								<form:input path="passwordLogin" type="password" class="inp-input" name="passwordLogin" id="passwordLogin" placeholder=" " />
						    	<span class="inp-label inp-label-P">Password</span>
						  		<span class="inp-focus"></span>
					  			<input type="checkbox" class="checkbox" onclick="password_toggle(this)">
					  		</div>
					  		<form:errors path="passwordLogin" class="error"/>
					  		<p class="error">
					  			<c:out value="${loginError}"/>
					  		</p>
						</form:label>
					</div>
					<button type="submit" class="submit" >
						Submit
					</button>
				</form:form>
			</div>
		</main>
		<footer>
			<p>
                Developed by <a href="https://github.com/AMontoya224" target="_blank">Andres Montoya</a> 
            </p>
		</footer>
	</body>
</html>