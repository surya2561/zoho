<%@page import="java.util.Hashtable"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

</style>
</head>
<body>

<%
try{
System.out.println(request.getAttribute("User"));
}
catch(Exception e)
{
	
}
String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String password = "surya1134";
Hashtable<Integer,String> names=new Hashtable();
try (Connection con = DriverManager.getConnection(url, user, password);
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from user_register")) {

    while (rs.next()) {
    	if(rs.getInt("approve")==0)
    	{
        names.put(rs.getInt("id"),rs.getString("name"));
    	}
    }
    request.setAttribute("list", names);
    
}
catch(Exception e)
{
	
}
%>
<p>Admin:<%=request.getParameter("name")%></p>
<form method="post" action="generateURL">

<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Check</th>
    <th>Delete</th>
  </tr>
  
<c:forEach items="${list}" var="u">
  <tr>
  <td><font>${u.getKey()}</font></td>
  
  <td><font>${u.getValue()}</font></td>
  
  <td><input type="checkbox" name="check"  value="${u.getKey()}"></td>
  <td><input type="checkbox" name="check1"  value="${u.getKey()}"></td>
  </tr>
  <input type="hidden" name="name"  value="${u.getValue()}">
<input type="hidden" name="id"  value="${u.getKey() }" %>
<input type="hidden" name="UserName" value="<%=request.getParameter("name")%>">
</c:forEach>
</table>

<p>
<button type="submit">Generate Url</button>
</p>
</form>

</body>
</html>