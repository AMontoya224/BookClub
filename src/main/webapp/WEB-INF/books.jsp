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
					Welcome, <c:out value="${name}"/>!
				</h1>
				<h3>
					Books from everyone's shelves:
				</h3>
			</div>
			<div>
				<form method="GET" action="/logout">
					<button type="submit" class="link" >
						logout
					</button>
				</form>
				<form method="GET" action="/books/new">
					<button type="submit" class="link" >
						+ Add a to my shelf!
					</button>
				</form>
			</div>
		</header>
		<main>
			<table>
	        	<thead>
			        <tr>
			            <th>Id</th>
			            <th>Title</th>
			            <th>Author Name</th>
			            <th>Posted By</th>
			        </tr>
			    </thead>
	        	<tbody>
					<c:forEach var="book" items="${booksList}">
						<tr>
	                        <td><c:out value="${book.getId()}"/></td>
	                        <td>
	                        	<form method="GET" action="/books/${book.getId()}">
									<button type="submit" class="link" >
										<c:out value="${book.getTitle()}"/>
									</button>
								</form>
	                        </td>
	                        <td><c:out value="${book.getAuthor()}"/></td>
	                        <td><c:out value="${book.getUser().getName()}"/></td>
						</tr>
	            	</c:forEach>
				</tbody>
			</table>
		</main>
		<footer>
			<p>
                Developed by <a href="https://github.com/AMontoya224" target="_blank">Andres Montoya</a> 
            </p>
		</footer>
	</body>
</html>