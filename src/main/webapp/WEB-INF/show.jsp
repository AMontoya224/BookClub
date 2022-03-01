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
	</head>
	<body>
		<header>
			<h1>
				<c:out value="${book.getTitle()}"/>
			</h1>
			<form method="GET" action="/books/b">
				<button type="submit" class="link" >
					back to the shelves
				</button>
			</form>
		</header>
		<main>
			<div class="container">
				<h3>
					<c:out value="${book.getUser().getName()}"/> read <c:out value="${book.getTitle()}"/> by <c:out value="${book.getAuthor()}"/>.
				</h3>
				<h4>
					Here are <c:out value="${book.getUser().getName()}"/>'s thoughts:
				</h4>
				<div class="container-2">
					<p>
						<c:out value="${book.getThoughts()}"/>
					</p>
				</div>
				<c:if test="${book.getUser().getEmail().equals(user)}">
					<form method="GET" action="/books/${book.getId()}/edit">
						<button type="submit" class="submit" >
							edit
						</button>
					</form>
				    <form method="POST" action="/books/${book.getId()}/delete">
				    	<input type="hidden" name="_method" value="DELETE" />
						<button type="submit" class="link" >
							delete
						</button>
					</form>  
				</c:if>
			</div>
		</main>
	</body>
</html>