<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr><td>ID</td><td>Total Marks</td><td>Name</td></tr>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/markstest","root","");
Statement st=conn.createStatement();
ResultSet res=st.executeQuery("SELECT * FROM student");
while(res.next())
{%>
<tr><td><%= res.getString(1) %></td><td><%= res.getString(2) %></td><td><%= res.getString(3) %></td><td><a href="Editmarks.jsp?q=<%= res.getString(1)  %>">Edit</a></td><td><a href="Deletemarksheet.jsp?q=<%= res.getString(1)  %>">Delete</a></td>
</tr>
<%} %>

<form action="MarksCal" method="post">

<tr><td><input type="number" name="txtid" /> </td>

<td><input type="number" name="txtmarks" /> </td>
<td><input type="text" name="txtname" /> </td>
<td><input type="submit" name="btnsubmit" />  </td></tr>

</form>

<%
if(request.getParameter("q")!=null)
{
	out.print(request.getParameter("q"));
}

%>
</table>
</body>
</html>