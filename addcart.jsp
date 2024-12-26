<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
    
<% 
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String contact = request.getParameter("contact");
		String city = request.getParameter("city");
		String gender = request.getParameter("gender");

		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cie3_practice","root","root");
		
		pst = con.prepareStatement("insert into cart(name,contact,city,gender) values(?,?,?,?)");
		pst.setString(1, name);
		pst.setString(2, contact);
		pst.setString(3, city);
		pst.setString(4, gender);
		pst.executeUpdate();
		response.sendRedirect("cart.jsp");
	
%>