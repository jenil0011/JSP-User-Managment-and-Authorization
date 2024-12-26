<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>

<%
	if(request.getParameter("submit")!=null)
	{
		String sname = request.getParameter("sname");
		String scontact = request.getParameter("scontact");
		String scity = request.getParameter("scity");
		String sgender = request.getParameter("sgender");
		String id = request.getParameter("id");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jenil_cie3","root","root");

		pst = con.prepareStatement("update student set sname=?, scontact=?, scity=?, sgender=? where id=?");
		pst.setString(1, sname);
		pst.setString(2, scontact);
		pst.setString(3, scity);
		pst.setString(4, sgender);
		pst.setString(5, id);
		pst.executeUpdate();
%>
	<script> alert('Record Updated.'); </script>
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
<div>
		<h1>Update Page</h1>
		<form method="post" action="#">
<%
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	String id = request.getParameter("id");
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jenil_cie3","root","root");
	
	pst = con.prepareStatement("select * from student where id=?");
	pst.setString(1, id);
	rs = pst.executeQuery();
	
	while(rs.next())
	{	
%>			
			<div>
				<label> Student Name:</label><br>
				<input type="text" name="sname" id="sname" value="<%= rs.getString("sname")%>">
			</div>
			<br>
			<div>
				<label>Student Contact:</label><br>
				<input type="number" name="scontact" id="scontact" value="<%= rs.getString("scontact")%>">
			</div>
			<br>
			<div>
				<label> Student City:</label><br>
				<input type="radio" name="scity" id="scity" value="surat" <% if(rs.getString("scity").equals("surat")) out.print("checked"); %> checked>surat
				<input type="radio" name="scity" id="scity" value="mumbai" <% if(rs.getString("scity").equals("mumbai")) out.print("checked");%> >mumbai
				<input type="radio" name="scity" id="scity" value="mirzapur" <% if(rs.getString("scity").equals("mirzapur")) out.print("checked"); %> >mirzapur
			</div>
			<br>
			<div>
				<label>Student Gender:</label><br>
				<select name="sgender" id="sgender">
					<option name="sgender" id="sgender" value="male" <% if(rs.getString("sgender").equals("male")) out.print("selected");%> checked>Male</option>
					<option name="sgender" id="sgender" value="female" <% if(rs.getString("sgender").equals("female")) out.print("selected"); %> >Female</option>
					<option name="sgender" id="sgender" value="other" <% if(rs.getString("sgender").equals("other")) out.print("selected"); %> >Other</option>
				</select>
			</div>
<%
	}
%>			
			<div>
				<input type="submit" name="submit" id="submit">
				<input type="reset" name="reset" id="reset">
			</div>
		
		<div>
			<h1><a href="home.jsp">Index Page</a></h1>
		</div>
		
		</form>
	</div>
</body>
</html>