<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String subject=request.getParameter("subject");
		String message=request.getParameter("message");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dcare","root","root");
		String s="insert into contact values(?,?,?,?)";
		PreparedStatement p=cn.prepareStatement(s);
		p.setString(1,name);
		p.setString(2,email);
		p.setString(3,subject);
		p.setString(4,message);
		
		int i=p.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("index.html");
		}
	%>
</body>
</html>