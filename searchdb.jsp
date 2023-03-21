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
	<h1 style="color:blue;">Patient Receipt</h1>
	<table border="1">
		<tr>
			<td>First Name</td>
			<td>Last Name</td>
			<td>Department</td>
			<td>Phone</td>
			<td>Date</td>
			<td>Time</td>
			<td>Message</td>
		</tr>
		<%
		String mobile=request.getParameter("mobile");
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dcare","root","root");
		String s="select * from apoint where phone="+mobile;
		PreparedStatement p=cn.prepareStatement(s);
		ResultSet r=p.executeQuery();
		if(r.next())
		{
			%>
				<tr>
					<td><%=r.getString("fname") %></td>
					<td><%=r.getString("lname") %></td>
					<td><%=r.getString("selectopt") %></td>
					<td><%=r.getString("phone") %></td>
					<td><%=r.getString("date") %></td>
					<td><%=r.getString("time") %></td>
					<td><%=r.getString("message") %></td>
				</tr>
			<%
		}
	%>
	</table><br><br>
	
	<button onclick="window.print()">PrintOut</button><a href="index.html">Home Page</a>

	
</body>
</html>