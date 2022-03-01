<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>
			Book Share
		</title>
		<link rel="stylesheet" type="text/css" href="/css/style2.css">
	</head>
	<body>
		<header>
			<h1>
				Add a Book to Your Shelf!
			</h1>
			<form method="GET" action="/books/b">
				<button type="submit" class="link" >
					back to the shelves
				</button>
			</form>
		</header>
		<main>
			<div class="container">
				<form:form method="POST" action="/books/new" modelAttribute="newBook">
					<div class="justify">
						<form:label path="title" for="title" class="inp">
							<form:input path="title" type="text" class="inp-input" name="title" id="title" placeholder=" " />
					    	<span class="inp-label">Title</span>
					  		<span class="inp-focus"></span>
					  		<form:errors path="title" class="error"/>
						</form:label>
					</div>
					<div class="justify">
						<form:label path="author" for="author" class="inp">
							<form:input path="author" type="text" class="inp-input" name="author" id="author" placeholder=" " />
					    	<span class="inp-label">Author</span>
					  		<span class="inp-focus"></span>
					  		<form:errors path="author" class="error"/>
						</form:label>
					</div>
					<div class="justify">
						<form:label path="thoughts" for="thoughts" class="inp">
							<form:input path="thoughts" type="text" class="inp-input" name="thoughts" id="thoughts" placeholder=" " />
					    	<span class="inp-label">My thoughts</span>
					  		<span class="inp-focus"></span>
					  		<form:errors path="thoughts" class="error"/>
						</form:label>
					</div>
					<button type="submit" class="submit" >
						Submit
					</button>
				</form:form>
			</div>
		</main>
	</body>
</html>