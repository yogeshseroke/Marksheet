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
<h1>Are you sure, you want to delete the record?</h1>
<%
if(request.getParameter("q")!=null)
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/markstest","root","");
	Statement st = conn.createStatement();
	ResultSet res = st.executeQuery("SELECT * FROM student WHERE studentid='"+request.getParameter("q")+"'");
	if(res.next())
	{
%>

<form action="MarksCalDelete" method="post">
<table border='1'>
<tr><td><p>Enter Student ID</p><td><input type="number" name="txtid" value="<%= res.getString(1) %>" /> </td></tr>
<tr><td><p>Enter Student Name</p><td><input type="text" name="txtname" value="<%= res.getString(3) %>"/> </td></tr>
<tr><td><p>Enter total marks</p><td><input type="number" name="txtmarks" value="<%= res.getString(2) %>" /> </td></tr>
<tr><td colspan="2"><input type="submit" name="btnsubmit" value="delete" />  </td></tr>


</table>

</form>
<%
}
}

%>

</body>
</html>