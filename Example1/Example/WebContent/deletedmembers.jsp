<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

p{
color:green;
}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

</style>



</head>
<body>
<div class="header" style="width:100%;height:20%;color:white;background-color:dark-blue">
<p style="color:darkblue">Welcome <%=request.getParameter("name") %>!!!</p>
<p style ="color:red">Here are the users Deleted by Admin</p>

</div>
<table >
<tr>
<td>Member_Id</td>
<td>Member_Emails</td>
<td>Member_Name</td>
<td>Owner_Name</td>
<td>Owner_Id</td>
<td>Group_Name</td>
</tr>

<%

String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String password = "surya1134";
try
{
	Connection con = DriverManager.getConnection(url, user, password);
	PreparedStatement stmt;
	stmt=con.prepareStatement("select * from selected_persons where delete = 1");
	
	ResultSet rst = stmt.executeQuery();

	while(rst.next())
	{
		%>
		<tr>
		<%
  		%>
 	    <td><%=rst.getString("id") %></td>
 	    <td><%=rst.getString("email") %></td>
  		<td><%=rst.getString("name") %></td>
  		<%
  		PreparedStatement stm= con.prepareStatement("select * from user_register where id=?");
	      stm.setInt(1, rst.getInt("owner_id"));
	      ResultSet rs = stm.executeQuery();
	      String name="";
	      while(rs.next())
	      {
	      name=rs.getString("name");
	      }
	      
  		
  		
  		%>
  		<td><%=name %></td>
  		<td><%=rst.getInt("owner_id")%></td>
  		<td><%=rst.getString("group_name")%></td>
  		</tr>
 	   <%  
	}
}
catch(Exception e)
{
	
}

%>
</table>




</body>
</html>