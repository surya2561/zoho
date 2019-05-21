<%@page import="java.util.Map"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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


</style>
</head>
<body>
<center><h2>welcome <%=request.getParameter("name") %></h2></center>
<%
String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String password = "surya1134";
TreeMap<String,String> names=new TreeMap();
TreeMap<Integer,TreeMap<String,String>> result=new TreeMap();

ArrayList<Integer>arr=new ArrayList();
ArrayList<Integer> res=new ArrayList();

ArrayList<ArrayList<String>> val=new ArrayList();

try (Connection con = DriverManager.getConnection(url, user, password);
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from list")) {
    int l;
    while (rs.next()) {
    	
    	if(rs.getInt("approve")!=1)
    	{
    	names.put(rs.getString("name"),rs.getString("UserNames"));
    	}
    	
    }
   
    
    request.setAttribute("list", names);
    request.setAttribute("no",res);
    
}
catch(Exception e)
{
	
}
%>
<form method="post" action="grantpermission">
<table>
  <tr>
    <th>Name</th>
    <th>Members</th>
    <th>Check</th>
  </tr>

<c:forEach items="${list}" var="a" >
<tr>

<td>
${a.getKey()}
</td>

<td>
${a.getValue()}
</td>


<td>


<input type="checkbox" name="check" value="${a.getKey()}" >
<input type="hidden" name="UserName" value="<%=request.getParameter("name") %>">
</td>

</tr>
</c:forEach>
</table>
<input type="submit" value="Approve">
</form>
</body>
</html>