<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
    
<% 
	if(request.getParameter("submit")!=null)
	{
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String contact = request.getParameter("contact");
		String city = request.getParameter("city");
		String gender = request.getParameter("gender");
		
		
		Connection con;
		PreparedStatement pst;
		PreparedStatement pst1;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cie3_practice","root","root");
		
		pst = con.prepareStatement("update cart set name=?, contact=?, city=?, gender=? where id=? ");
		pst.setString(1, name);
		pst.setString(2, contact);
		pst.setString(3, city);
		pst.setString(4, gender);
		pst.setString(5, id);
		pst.executeUpdate();
		
		
		pst1 = con.prepareStatement("update random1 set name=?, contact=?, city=?, gender=? where id=? ");
		pst1.setString(1, name);
		pst1.setString(2, contact);
		pst1.setString(3, city);
		pst1.setString(4, gender);
		pst1.setString(5, id);
		pst1.executeUpdate();
%>
	<script> alert('cart Updated.');</script>
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
	<h1> form random</h1>
	<form action="#" method="post">
<% 
	String id = request.getParameter("id");
	
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cie3_practice","root","root");
	
	pst = con.prepareStatement("select * from cart where id=? ");
	pst.setString(1, id);
	rs = pst.executeQuery();
	
	while(rs.next())
	{
%>	
		<div>
			<label>Name:</label><br>
			<input type="text" id="name" name="name" value="<%= rs.getString("name") %>">
		</div>
		<br>
		<div>
			<label>Contact:</label><br>
			<input type="text" id="contact" name="contact" value="<%= rs.getString("contact") %>">
		</div>
		<br>
		<div>
			<label>City:</label><br>
			<select name="city" id="city">
				<option name="city" id="city" value="surat" <% if(rs.getString("city").equals("surat")) out.print("selected"); %> >surat</option>
				<option name="city" id="city" value="johnpur" <% if(rs.getString("city").equals("johnpur")) out.print("selected"); %> >johnpur</option>
				<option name="city" id="city" value="mirzapur" <% if(rs.getString("city").equals("mirzapur")) out.print("selected"); %> >mirzapur</option>
			</select>
		</div>
		<br>
		<div>
			<label>Gender:</label><br>
			<input type="radio" id="gender" name="gender" value="male" <% if(rs.getString("gender").equals("male")) out.print("checked"); %> >male
			<input type="radio" id="gender" name="gender" value="female" <% if(rs.getString("gender").equals("female")) out.print("checked"); %> >female
			<input type="radio" id="gender" name="gender" value="other" <% if(rs.getString("gender").equals("other")) out.print("checked"); %> >other
		</div>
		<br>
<%
	}
%>		
		<div>
			<input type="submit" id="submit" name="submit" value="submit">
			<input type="reset" id="reset" name="reset" value="reset">
		</div>
		
		<div>
			<a href="cart.jsp"><h1>Cart page</h1></a>
		</div>
	</form>
</div>



</body>
</html>