<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

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



.open-button1 {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 20px;
  left: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup1 {
  display: none;
  position: fixed;
  bottom: 0;
  left: 18px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container1 {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container1 input[type=text], .form-container1 input[type=number] {
  width: 100%;
  padding: 5px;
  padding-top:5px;
  margin: 1px 0 10px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container1 input[type=text]:focus, .form-container1 input[type=number]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container1 .btn1 {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

.form-container1 .cancel1 {
  background-color: red;
}

.form-container1 .btn1:hover, .open-button1:hover {
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
function openForm1() {
	  document.getElementById("myForm1").style.display = "block";
	}

	function closeForm1() {
	  document.getElementById("myForm1").style.display = "none";
	}
</script>


</head>
<body>
<table>
<tr>
<td>Member_Id</td>
<td>Member_Email</td>
<td>Member_Name</td>
<td>Member_Group</td>
<td>Status</td>

</tr>
<%

try{
String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String password = "surya1134";
String group=request.getParameter("group");
int id=Integer.parseInt(request.getParameter("id"));
Connection con = DriverManager.getConnection(url, user, password);
ResultSet rst;

try
{
	PreparedStatement stmt=con.prepareStatement("select * from selected_persons where owner_id = ? and group_name = ? and delete = 0");
	stmt.setInt(1,id);
	stmt.setString(2, group);
	rst=stmt.executeQuery();
	while(rst.next())
	{
		%>
		<tr>
		<%
  		%>
 	    <td><%=rst.getInt("id") %></td>
 	    <td><%=rst.getString("email") %></td>
  		<td><%=rst.getString("name")%></td>
  		<td><%=group%></td>
  		<td>
  		<%
  		if(rst.getInt("approve")==1)
  			out.print("Approved");
  		else
  			out.print("Yet to be approve");
  		
  		%>
  		
  		</td>
  		</tr>
 	   <%  
	}
}
catch(Exception e)
{
	
}
}
catch(Exception e)
{
	
}

%>


</table>

<button class="open-button" onclick="openForm()">DELETE USER</button>

<div class="form-popup" id="myForm" >
  <form action="./deletemember" class="form-container" method="post">
    <h1>Login</h1>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" >

    
    <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>">
    
    <input type="hidden" name="gname" id="gname" value="<%=request.getParameter("group")%>">
    <button type="submit" class="btn">Delete</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
    
  </form>
</div>
<button class="open-button1" onclick="openForm1()">ADD USER</button>

<div class="form-popup1" id="myForm1" >
  <form action="./addmember" class="form-container1" method="get">
    <h1>Login</h1>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email">

    <label for="name"><b>Member Name</b></label>
    <input type="text" placeholder="Enter member name" name="name" required>

    <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>">
    <input type="hidden" name="gname" id="gname" value="<%=request.getParameter("group")%>">
    
    <button type="submit" class="btn1">ADD</button>
    <button type="button" class="btn1 cancel1" onclick="closeForm1()">Close</button>
    
  </form>
</div>










</body>
</html>