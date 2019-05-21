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
/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=number] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=number]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

.form-container .cancel {
  background-color: red;
}

.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}

</style>


<script>
function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
</script>

</head>
<body>
<div class="header" style="width:100%;height:20%;color:white;background-color:dark-blue">
<p style="color:darkblue">Welcome <%=request.getParameter("name") %>!!!</p>
</div>
<table >
<tr>
<td>Member_Id</td>
<td>Member_Emails</td>
<td>Member_Name</td>
<td>Group</td>
</tr>

<%

String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String password = "surya1134";
try
{
	Connection con = DriverManager.getConnection(url, user, password);
	PreparedStatement stmt;
	stmt=con.prepareStatement("select * from selected_persons where owner_id = ? and approve = 0 and delete = 0");
	
	stmt.setInt(1,Integer.parseInt(request.getParameter("id")));
	ResultSet rst = stmt.executeQuery();

	while(rst.next())
	{
		%>
		<tr>
		<%
  		%>
 	    <td><%=rst.getString("id") %></td>
 	    <td><%=rst.getString("email") %></td>
  		<td><%=rst.getString("name")%></td>
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

<button class="open-button" onclick="openForm()">Open Form</button>

<div class="form-popup" id="myForm" >
  <form action="./userdeleteuser" class="form-container" method="post">
    <h1>Login</h1>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>
    <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>">


    <input type="hidden" name="name" id="name" value="<%=request.getParameter("name")%>">
    <button type="submit" class="btn">Delete</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
    
  </form>
</div>


</body>
</html>