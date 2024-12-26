<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
    
<% 
	if(request.getParameter("submit")!=null)
	{
		String fname = request.getParameter("fname");
		String fnumber = request.getParameter("fnumber");
		String ftype = request.getParameter("ftype");
		String fsalary = request.getParameter("fsalary");
		String femail = request.getParameter("femail");
		String fpassword = request.getParameter("fpassword");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		// con = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_name","username","userpassword");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jenil_cie3","root","root");
	
	
		pst = con.prepareStatement("insert into faculy(fname,fnumber,ftype,fsalary,femail,fpassword) values(?,?,?,?,?,?)");
		pst.setString(1, fname);
		pst.setString(2, fnumber);
		pst.setString(3, ftype);
		pst.setString(4, fsalary);
		pst.setString(5, femail);
		pst.setString(6, fpassword);
		pst.executeUpdate();
		response.sendRedirect("login.jsp");		
	}

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Faculty Table</h1>
	<form method="post" action="#">
		<div>
			<label>Faculty Name:</label><br>
			<input type="text" id="fname" name="fname">
		</div>
		<div>
			<label>Faculty Number:</label><br>
			<input type="text" id="fnumber" name="fnumber">
		</div>
		<div>
			<label>Faculty Type:</label><br>
			<input type="text" id="ftype" name="ftype">
		</div>
		<div>
			<label>Faculty Salary:</label><br>
			<input type="text" id="fsalary" name="fsalary">
		</div>
		<div>
			<label>Faculty Email:</label><br>
			<input type="text" id="femail" name="femail">
		</div>
		<div>
			<label>Faculty Password:</label><br>
			<input type="text" id="fpassword" name="fpassword">
		</div>
		<div>
		<br>	<input type="submit" id="submit" name="submit">
			<input type="reset" id="reset" name="reset">
		</div>
	</form>
</body>
</html>