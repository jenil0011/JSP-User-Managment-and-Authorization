<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>

<%
	if(request.getParameter("submit")!=null)
	{
		String name = request.getParameter("name");
		String contact = request.getParameter("contact");
		String city = request.getParameter("city");
		String gender = request.getParameter("gender");
		
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cie3_practice","root","root");
		
		pst = con.prepareStatement("insert into random1(name,contact,city,gender) values(?,?,?,?)");
		pst.setString(1, name);
		pst.setString(2, contact);
		pst.setString(3, city);
		pst.setString(4, gender);
		pst.executeUpdate();
%>
	<script> alert('Record Inserted.');</script>
<% 		
	}
%>
    
<% 
	String email = (String) session.getAttribute("email");
	
	if(email == null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
		out.println("welcom:"+email);
	}
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="logout.jsp">
	<a href="logout.jsp">	
	<input type="submit" value="logout">
	</a>
</form>

<div>
	<h1> form random</h1>
	<form action="#" method="post">
		<div>
			<label>Name:</label><br>
			<input type="text" id="name" name="name">
		</div>
		<br>
		<div>
			<label>Contact:</label><br>
			<input type="text" id="contact" name="contact">
		</div>
		<br>
		<div>
			<label>City:</label><br>
			<select name="city" id="city">
				<option name="city" id="city" value="surat">surat</option>
				<option name="city" id="city" value="johnpur">johnpur</option>
				<option name="city" id="city" value="mirzapur">mirzapur</option>
			</select>
		</div>
		<br>
		<div>
			<label>Gender:</label><br>
			<input type="radio" id="gender" name="gender" value="male">male
			<input type="radio" id="gender" name="gender" value="female">female
			<input type="radio" id="gender" name="gender" value="other">other
		</div>
		<br>
		
		<div>
			<input type="submit" id="submit" name="submit" value="submit">
			<input type="reset" id="reset" name="reset" value="reset">
		</div>
	</form>
</div>




<div>
	<h1>Table</h1>
	<table border=1>
		<thead>
			<tr>
				<th> Name </th>
				<th> Contact </th>
				<th> City </th>
				<th> Gender </th>
				<th> Edit </th>
				<th> Delete </th>
				<th> Add to Cart </th>
			</tr>
<%
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cie3_practice","root","root");
	
	String query = "select * from random1";
	Statement st = con.createStatement();
	rs = st.executeQuery(query);
	
	while(rs.next())
	{
		String id = rs.getString("id");
		String name = rs.getString("name");
		String contact = rs.getString("contact");
		String city = rs.getString("city");
		String gender = rs.getString("gender");
%>			
			<tr>
				<td><%= rs.getString("name") %></td>
				<td><%= rs.getString("contact") %></td>
				<td><%= rs.getString("city") %></td>
				<td><%= rs.getString("gender") %></td>
				<td><a href="update.jsp?id=<%= id %>">Edit</a></td>
				<td><a href="delete.jsp?id=<%= id %>">Delete</a></td>
				<td><a href="addcart.jsp?id=<%= id %>&name=<%= name %>&contact=<%= contact %>&city=<%= city %>&gender=<%= gender %>">Add to Cart</a></td>
			</tr>
<% 
}
%>
		</thead>
	</table>
</div>


</body>
</html>