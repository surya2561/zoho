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

body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

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


<table >
<tr>
<td>Member_Email</td>
<td>Member_Admin_Id</td>
<td>Member_Admin</td>
<td>Group_Name</td>
</tr>

<%
String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String password = "surya1134";
try (Connection con = DriverManager.getConnection(url, user, password);
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from selected_persons where approve = 1 and delete = 0")) {
	    while(rs.next())
	    {
	    	%>
	    	<tr>
	    	<%
	    %>
	      <td><%=rs.getString("email") %></td>
	      
	      <td><%=rs.getString("owner_id") %></td>
	      <%
	      
	      PreparedStatement stm= con.prepareStatement("select * from user_register where id=?");
	      stm.setInt(1, Integer.parseInt(rs.getString("owner_id")));
	      ResultSet rst = stm.executeQuery();
	      String name="";
	      while(rst.next())
	      {
	      name=rst.getString("name");
	      }
	      
	      %>
	      <td><%=name %></td>
	       <td><%=rs.getString("group_name") %></td>
	      </tr>  
	    <%	
	    }
	    
}
catch(Exception e)
{
	
}

%>

</table>
<body>
<button class="open-button" onclick="openForm()">Open Form</button>

<div class="form-popup" id="myForm" >
  <form action="./deleteuser" class="form-container" method="post">
    <h1>Login</h1>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="id"><b>AdminId</b></label>
    <input type="number" placeholder="Enter Admin Id" name="id" required>
    
    <label for="group"><b>Group Name</b></label>
    <input type="text" placeholder="Enter Group Name" name="group" required>

    <input type="hidden" name="name" id="name" value="<%=request.getParameter("name")%>">
    <button type="submit" class="btn">Delete</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
    
  </form>
</div>

</body>
</html>