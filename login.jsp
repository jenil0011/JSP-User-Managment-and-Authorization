<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>

<% 
	if(request.getParameter("submit")!=null)
	{
		String femail = request.getParameter("femail");
		String fpassword = request.getParameter("fpassword");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jenil_cie3","root","root");
		
		pst = con.prepareStatement("select * from faculy where femail=? and  fpassword=?");
		pst.setString(1, femail);
		pst.setString(2, fpassword);
		rs = pst.executeQuery();
		
		if(rs.next())
		{
			session = request.getSession();
			session.setAttribute("femail", femail);
			response.sendRedirect("home.jsp");
		}
		else
		{
			out.println("Login Failded!");
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
<h1>Faculty Table Login</h1>
	<form method="post" action="#">
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