package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteUser extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		String name=req.getParameter("name");
		String group=req.getParameter("group");
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
			
			
			st=con.prepareStatement("update selected_persons set delete = 1 where owner_id = ? and email = ? and group_name = ?");
			st.setInt(1, id);
			st.setString(2,email);
			st.setString(3, group);
			st.executeUpdate();
			req.setAttribute("UserName", name);
			RequestDispatcher dispatcher = req.getRequestDispatcher("./Admin.jsp");
	     	dispatcher.forward(req, res);
			
		}
		catch(Exception e)
		{
			
	    }
		
     	  
	}

}
