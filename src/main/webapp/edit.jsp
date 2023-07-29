<%@page import="com.entites.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Edit your note</h1>
	<br>
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();

		Note note = (Note) s.get(Note.class, noteId);
		%>

		<!-- form tag this is form page -->
		<form action="UpdateServlet" method="post">
		
		<input value="<%= note.getId()%>" name="noteId" type="hidden"/>
		
			<div class="form-group">
				<label for="exampleInputEmail1">Note Title</label> <input required
					name="title" type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter Title" value="<%= note.getTitle()%>"/>
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" required class="form-control" id="content"
					placeholder="Enter your content here" style="height: 200px;">
					<%= note.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Your Note</button>

			</div>
		</form>
	</div>


</body>
</html>
