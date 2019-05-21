<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<div class="topnav">
  <a class="active" href="./index.jsp">Home</a>
  <a href="./SelectUsers.jsp?name=<%=request.getAttribute("UserName")%>&id=<%=request.getAttribute("UserId")%>">Add Users</a>
  <a href="./SeeUsers.jsp?name=<%=request.getAttribute("UserName")%>&id=<%=request.getAttribute("UserId")%>">View Users</a>
  <a href="./SeeRequestedUsers.jsp?name=<%=request.getAttribute("UserName")%>&id=<%=request.getAttribute("UserId")%>">Requested Users</a>
<a href="./SeeDeletedUsers.jsp?name=<%=request.getAttribute("UserName")%>&id=<%=request.getAttribute("UserId")%>">Deleted Users</a>
</div>
<center>
<div style="padding:100px">
  <h2>Welcome <%=request.getAttribute("UserName") %></h2> 
  <p>content..</p>
</div>
</center>
</body>
</html>
