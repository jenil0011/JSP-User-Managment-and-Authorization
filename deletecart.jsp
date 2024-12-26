<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>    
    
<% 
		String id = request.getParameter("id");

		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cie3_practice","root","root");
		
		pst = con.prepareStatement("delete from cart where id=? ");
		pst.setString(1, id);
		pst.executeUpdate();
		response.sendRedirect("cart.jsp");
	
%>