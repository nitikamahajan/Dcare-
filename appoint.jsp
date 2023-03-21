<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String selectopt=request.getParameter("selectopt");
		String phone=request.getParameter("phone");
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		String message=request.getParameter("message");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dcare","root","root");
		String s="insert into apoint values(?,?,?,?,?,?,?)";
		PreparedStatement p=cn.prepareStatement(s);
		p.setString(1,fname);
		p.setString(2,lname);
		p.setString(3,selectopt);
		p.setString(4,phone);
		p.setString(5,date);
		p.setString(6,time);
		p.setString(7,message);
		
		int i=p.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("Home.jsp");
		}
	%>
</body>
</html>