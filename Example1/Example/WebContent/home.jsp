<%@page import="java.sql.PreparedStatement"%>
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

</style>
</head>
<body>
<div class="header" style="width:100%;height:20%;color:white;background-color:dark-blue">
<p style="color:darkblue">Welcome <%=request.getParameter("name") %>!!!</p>
</div>
<%
String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String password = "surya1134";
TreeMap<Integer,String> names=new TreeMap();
ArrayList<Integer>arr=new ArrayList();
ResultSet res;
try (Connection con = DriverManager.getConnection(url, user, password);
        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery("select * from persons")){	

    
    String var=",";
    PreparedStatement stmt=con.prepareStatement("select * from list where id = ?");
	stmt.setInt(1, Integer.parseInt(request.getParameter("id")));
	ResultSet rst = stmt.executeQuery();
	while (rst.next())
	{
		var=rst.getString("user_ids");
	}
	String array[]=var.split(",");
	int c=1,d=-1;
	while (rs.next()) {
		for(int i=0;i<array.length;i++)
		{
			if(rs.getInt("id") == Integer.parseInt(array[i]))
			{
				c=-1;
			}   
	    }
		if(c==1)
		{
		    names.put(rs.getInt("id"),rs.getString("name"));
		}
		else
		{
		    names.put(-(rs.getInt("id")),rs.getString("name"));
		    d-=1;
		}
		c=1;
	}
    request.setAttribute("list", names);
    
}
catch(Exception e)
{
	
}
%>
<form method="post" action="url">
<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Check</th>
  </tr>
  
<c:forEach items="${list}" var="u">
<tr>
<td>
${u.getKey() < 0 ? -u.getKey():u.getKey()}</td>
<td>${u.getValue()}</td>
<td>
<c:if test="${u.getKey()<0}">
<input type="checkbox" name="check" value="${u.getKey() < 0 ? -u.getKey():u.getKey()}" checked >
</c:if>

<c:if test="${u.getKey()>0}">
<input type="checkbox" name="check" value="${u.getKey() < 0 ? -u.getKey():u.getKey()}" >
</c:if>
</td>
</c:forEach>
</table>

<input type="hidden" name="name"  value=<%=request.getParameter("name")%>>
<input type="hidden" name="id"  value=<%=request.getParameter("id")%>>

<button type="submit" style="margin-top:10px">Upload</button>
</form>
</body>
</html>