<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.demo.GrantPermission" %>
<%@ page import="java.util.Collection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>

${param.message}

<div class="topnav">
  <a class="active" href="./index.jsp">Home</a>
  <a href="./viewrequest.jsp?name=<%=request.getAttribute("UserName")%>">Add Users</a>
  <a href="./ViewRequestUsers.jsp?name=<%=request.getAttribute("UserName")%>">View User Requests</a>
  <a href="./groupedit.jsp?name=<%=request.getAttribute("UserName")%>">Edit Approved Groups</a>
  <a href="./deletedmembers.jsp?name=<%=request.getAttribute("UserName")%>">Deleted members</a>
  <a href="./deletegroups.jsp?name=<%=request.getAttribute("UserName")%>">Delete groups</a>
</div>

<div style="padding:px">
  <h2>Welcome <%=request.getAttribute("UserName") %></h2> 
 
 <%
 
 try
 {
	ArrayList<Integer> current_id_list =  (ArrayList<Integer>)request.getAttribute("current_id_list");

	ArrayList<String> current_group_list =  (ArrayList<String>)request.getAttribute("current_group_list");
	ArrayList<String> invalid_persons =  (ArrayList<String>)request.getAttribute("req_persons");

	ArrayList<Integer> exist_id_list =  (ArrayList<Integer>)request.getAttribute("exist_id_list");
	ArrayList<String> exist_group_list =  (ArrayList<String>)request.getAttribute("exist_group_list");
	
	for (int itr=0;itr<current_id_list.size();itr++)  
	 {
		 %>
		 <p><%=invalid_persons.get(itr) %> already in <%=exist_group_list.get(itr) %> of <%=exist_id_list.get(itr) %> so <strong>Admin Id: </strong><%=current_id_list.get(itr) %>   <strong>Group: </strong><%=current_group_list.get(itr) %> was not permitted</p>
		 
		 <%
	 }
 }
 catch(Exception e)
 {
	 
 }
 
 %>
</div>




</body>



</html>