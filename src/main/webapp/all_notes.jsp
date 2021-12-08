
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vaibhavmojidra.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.vaibhavmojidra.helper.SessionFactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>All Notes</title>
<%@include file="AlljsAndCss.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	   $(".active").removeClass("active");
	   $("#all_notes").addClass("active");
	});
</script>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container">
	<br>
		<h2>All Notes</h2>
		<%
			SimpleDateFormat f = new SimpleDateFormat("HH:mm dd MMMM yyyy");
			Session session2 = SessionFactoryProvider.getSessionFactory().openSession();
			Query q = session2.createQuery("from Note");
			List<Note> notelist = q.list();
			for (Note n : notelist) {
		%>
		<div class="card mt-3">
			<div class="card-body">
			<img class="card-img-top" src="img/notes.png" style="max-width: 50px" alt="Card image cap"/>
			<br><br>
				<h5 class="card-title"><%=n.getTitle()%></h5>
				<p class="card-text"><%=n.getContent()%></p>
				<br>
				<div class="container text-right">
					<h6 class="card-title"><%=f.format(n.getAddedDate())%></h6>
				</div>
				<form action="DeleteServlet" method="post" class="inline">
					<input type="hidden" name="id" value="<%=n.getId()%>">					
					<button type="submit" class="btn btn-danger">Delete</button>
				</form>
				<form action="edit.jsp" method="post" class="inline">
					<input type="hidden" name="id" value="<%=n.getId()%>">
					<button type="submit" class="btn btn-success"> Update</button>
				</form>
				
				
			</div>
		</div>
		<%
			}
		session2.close();
		%>
	</div>
</body>
</html>