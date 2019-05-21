<%@page import="java.util.Arrays"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
<center><h2>welcome <%=request.getParameter("name") %></h2></center>

<form method="post" action="./deletegroup">

<table >
<tr>
<td>Member</td>
<td>Member_Emails</td>
<td>Member_Admin</td>
<td>Member_Admin_Id</td>
<td>Check</td>
<td>Groups</td>
</tr>

<%
String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String password = "surya1134";
ArrayList<Integer>id_list=new ArrayList();
try (Connection con = DriverManager.getConnection(url, user, password);
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from selected_persons where approve = 0 and delete = 0")) {
	  	while(rs.next())
	  	{
	  		id_list.add(rs.getInt("owner_id"));
	  	}
	  	
	  	List<Integer> newList = id_list.stream().distinct().collect(Collectors.toList());
	  	
	  	PreparedStatement stmt;
	  	ResultSet rst;
	  	ResultSet res;
	  	ResultSet r;
	  	String temp="";
	  	String member_emails="";
	  	String [] arr;
	  	String owner_name="";
	  	int owner_id=0;
	  	for(int i=0;i<newList.size();i++)
	  	{
	  	stmt=con.prepareStatement("select * from user_register where id = ?");
	  	stmt.setInt(1,newList.get(i));
		r=stmt.executeQuery();
		while(r.next())
		{
			owner_name=r.getString("name");
		}
	  	
	  	stmt=con.prepareStatement("select * from selected_persons where owner_id = ? and approve=0 and delete = 0");
	  	stmt.setInt(1,newList.get(i));
	  	res=stmt.executeQuery();
	    
	  	String group_var="";
	  	while(res.next())
	  	{
	  		group_var+=res.getString("group_name");
	  		group_var+=',';
	  	}
	  	
	  	String []new_array=group_var.split(",");
	  	LinkedHashSet<String> grp = new LinkedHashSet<String>(Arrays.asList(new_array));
	  	String[] groups = grp.toArray(new String[ grp.size() ]);
	  	for(int itr1=0;itr1<groups.length;itr1++)
	  	{
	  	
	  		%>
		  	<tr>
		  	<%
	  		stmt=con.prepareStatement("select * from selected_persons where owner_id = ? and approve=0 and delete = 0 and group_name = ?");
		  	stmt.setInt(1,newList.get(i));
		  	stmt.setString(2, groups[itr1]);
		  	rst=stmt.executeQuery();
		  	while(rst.next())
		  	{
		  	   temp+=rst.getString("name");
		       member_emails+=rst.getString("email");
		       temp+=",";
		  	   member_emails+=",";
		  	   owner_id=rst.getInt("owner_id");
		  	}
		  	%>
		  	<%
		  	if(owner_id!=0)
		  	{
		  		String var=Integer.toString(owner_id)+','+groups[itr1];
		  		System.out.println(var);
		  		
		  		%>
		  		 <td><%=temp%></td>
		 	    <td><%=member_emails %></td>
		 	    <td><%=owner_name %></td>
		 	     <td><%=owner_id %></td>
		 	     <td><%=groups[itr1] %></td>
		 	     
		 	   
		 	   <td><input type="checkbox" name="check"  value="<%=var%>"> </td>
	    	       
		 	 <%
		  	}
		  	temp="";
	        member_emails="";
	      }
	  	}
	  }

catch(Exception e)
{

}

%>
</tr>
</table>
<input type="hidden" name="UserName" value="<%=request.getParameter("name") %>">
<input type="submit" value="Permit">

</form>








</body>
</html>