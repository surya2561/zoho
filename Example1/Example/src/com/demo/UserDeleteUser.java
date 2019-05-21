package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserDeleteUser extends HttpServlet{
	
	public void service(HttpServletRequest req, HttpServletResponse res)
	{
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String var=req.getParameter("id").toString();
		int id=Integer.parseInt(var);
		String url = "jdbc:postgresql://localhost:5432/postgres";
		String user = "postgres";
		String password = "surya1134";
		try 
	    {
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement st;
			st=con.prepareStatement("update selected_persons set delete=1 where email = ? ");
			st.setString(1, email);
			st.executeUpdate();
			res.sendRedirect("./SeeRequestedUsers.jsp?name="+name+"&id="+id);
		}
		catch(Exception e)
		{
			
		}
	}

}
