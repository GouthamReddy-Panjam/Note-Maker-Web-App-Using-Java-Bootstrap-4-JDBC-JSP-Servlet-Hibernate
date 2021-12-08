<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@include file="AlljsAndCss.jsp" %> 
    <title>Home Page</title>
    <script type="text/javascript">
$(document).ready(function(){
	   $(".active").removeClass("active");
	   $("#home").addClass("active");
	});
</script>
  </head>
  <body>
   <div class="container-fluid p-0 m-0">
   <%@include file="navbar.jsp" %>
   <br>
   <div class="card">
   <img alt="" class="img-fluid mx-auto" style="width:400px"   src="img/notes.png"/>
   	<h1 class="text-primary text-uppercase text-center">Start Making your notes</h1>
   	<br>
   	<div class="container text-center">
   		<a href="add_notes.jsp"class="btn btn-outline-primary text-center">Start Here</a>
   	</div>
   	<br>
   	<br>
   </div>
   
   </div>
  </body>
</html>
