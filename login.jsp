<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@ page import="java.sql.*" %>

<% 
	if(request.getParameter("submit")!=null)
	{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cie3_practice","root","root");
		
		pst = con.prepareStatement(" select * from random where email=? and password=? ");
		pst.setString(1, email);
		pst.setString(2, password);
		rs = pst.executeQuery();
		
		if(rs.next())
		{
			session = request.getSession();
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		else
		{
			out.println("Invalid email or password");		
		}
	}
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="#" method="post">
		<div>
			<label>Email:</label><br>
			<input type="text" id="email" name="email">
		</div>
		<br>
		<div>
			<label>Password:</label><br>
			<input type="text" id="password" name="password">
		</div>
		<br>
		<div>
			<input type="submit" id="submit" name="submit" value="submit">
			<input type="reset" id="reset" name="reset" value="reset">
		</div>
	</form>
</body>
</html>