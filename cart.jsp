<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div>
	<h1>Cart Table</h1>
	<table border=1>
		<thead>
			<tr>
				<th> Name </th>
				<th> Contact </th>
				<th> City </th>
				<th> Gender </th>
				<th> Edit </th>
				<th> Delete </th>
			</tr>
<%
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cie3_practice","root","root");
	
	String query = "select * from cart";
	Statement st = con.createStatement();
	rs = st.executeQuery(query);
	
	while(rs.next())
	{
		String id = rs.getString("id");
%>			
			<tr>
				<td><%= rs.getString("name") %></td>
				<td><%= rs.getString("contact") %></td>
				<td><%= rs.getString("city") %></td>
				<td><%= rs.getString("gender") %></td>
				<td><a href="updatecart.jsp?id=<%= id %>">Update</a></td>
				<td><a href="deletecart.jsp?id=<%= id %>">Delete</a></td>
			</tr>
<% 
}
%>
		</thead>
	</table>
</div>
<div>
			<a href="home.jsp"><h1>Home page</h1></a>
		</div>
</body>
</html>