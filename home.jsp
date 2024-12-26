<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>

<%
	String femail = (String) session.getAttribute("femail");
	
	if(femail == null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
		out.println("welcome:"+femail);
	}
%>

<%
	if(request.getParameter("submit")!=null)
	{
		String sname = request.getParameter("sname");
		String scontact = request.getParameter("scontact");
		String scity = request.getParameter("scity");
		String sgender = request.getParameter("sgender");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jenil_cie3","root","root");
		
		pst = con.prepareStatement("insert into student(sname,scontact,scity,sgender) values(?,?,?,?)");
		pst.setString(1, sname);
		pst.setString(2, scontact);
		pst.setString(3, scity);
		pst.setString(4, sgender);
		pst.executeUpdate();
%>
	<script> alert('Record Inserted.');</script>
<%
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
		<input type="submit" value="logout" >
		</a>
	</form>

	<div>
		<h1>div for form</h1>
		<form method="post" action="#">
			<div>
				<label> Student Name:</label><br>
				<input type="text" name="sname" id="sname">
			</div>
			<br>
			<div>
				<label>Student Contact:</label><br>
				<input type="number" name="scontact" id="scontact">
			</div>
			<br>
			<div>
				<label> Student City:</label><br>
				<input type="radio" name="scity" id="scity" value="surat" checked>surat
				<input type="radio" name="scity" id="scity" value="mumbai" >mumbai
				<input type="radio" name="scity" id="scity" value="mirzapur">mirzapur
			</div>
			<br>
			<div>
				<label>Student Gender:</label><br>
				<select name="sgender" id="sgender">
					<option name="sgender" id="sgender" value="male" checked>Male</option>
					<option name="sgender" id="sgender" value="female">Female</option>
					<option name="sgender" id="sgender" value="other">Other</option>
				</select>
			</div>
			<div>
				<input type="submit" name="submit" id="submit">
				<input type="reset" name="reset" id="reset">
			</div>
		
		</form>
	</div>
	
	
	<div>
		<h1>div for table</h1>
		<table border=1>
			<thead>
					<tr>
						<th>Name</th>
						<th>Contact</th>
						<th>City</th>
						<th>Gender</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>	
<% 
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jenil_cie3","root","root");
	
	String query = "select * from student";
	Statement st = con.createStatement();
	rs = st.executeQuery(query);
	
	while(rs.next())
	{
		String id = rs.getString("id");
%>						
					<tr>
						<td><%= rs.getString("sname") %></td>
						<td> <%= rs.getString("scontact") %> </td>
						<td> <%= rs.getString("scity")%> </td>
						<td> <%= rs.getString("sgender") %> </td>
						<td><a href="update.jsp?id=<%= id %>">Edit</a> </td>
						<td><a href="delete.jsp?id=<%= id %>">Delete</a> </td>
					</tr>
<%
	}
%>					
			</thead>
		</table>
	</div>
	
</body>
</html>