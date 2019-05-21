package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewUserRequest extends HttpServlet{
	
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		try
		{
			String name=req.getParameter("name");
			req.setAttribute("UserName", name);

			String url = "jdbc:postgresql://localhost:5432/postgres";
	        String user = "postgres";
	        String password = "surya1134";
	        try (Connection con = DriverManager.getConnection(url, user, password);
	                Statement st = con.createStatement();
	                ResultSet rs = st.executeQuery("select * from requested_members where del = 0")) {

	            while (rs.next()) {
	            	if(rs.getInt("approve")==0)
	            	{
	            		RequestDispatcher dispatcher = req.getRequestDispatcher("./viewrequest.jsp");
	        	     	dispatcher.forward(req, res);
	            	}
	            	}
	            }
	        catch(Exception e)
	        {
	        	
	        }
			

    		RequestDispatcher dispatcher = req.getRequestDispatcher("./Admin.jsp");
	     	dispatcher.forward(req, res);
			
		}
		catch(Exception e)
		{
			
		}
		
		
	}

}
