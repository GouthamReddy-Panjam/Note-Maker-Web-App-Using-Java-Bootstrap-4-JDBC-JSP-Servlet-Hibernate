<%@page import="com.vaibhavmojidra.helper.SessionFactoryProvider"%>
<%@page import="com.vaibhavmojidra.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Edit Notes</title>
<%@include file="AlljsAndCss.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		
	</div>
	<div class="container">
	<br>
	<h2>Edit your note</h2>
	<%
		int noteid=Integer.parseInt(request.getParameter("id").trim());
		Session session3=SessionFactoryProvider.getSessionFactory().openSession();
		
		Note note=(Note)session3.get(Note.class,noteid);
		session3.close();
	%>
	
		<form action="UpdateServlet" method="post">
			<input type="hidden" value="<%=note.getId()%>" name="id"/>
			<div class="form-group">
				<label for="title">Note title</label>
				<input type="text" class="form-control" id="title" name="title"
					aria-describedby="emailHelp" placeholder="Enter title" required value="<%=note.getTitle()%>">
			</div>
			<div class="form-group">
				<label for="content">Note content</label> 
				<textarea name="content" id="content" required placeholder="Enter your content here"
				class="form-control"
				style="height:300px"><%=note.getContent()%></textarea>
			</div>
			
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save</button>
			</div>
			
		</form>
		</div>
</body>
</html>