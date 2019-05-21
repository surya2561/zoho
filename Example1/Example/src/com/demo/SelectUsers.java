package com.demo;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectUsers extends HttpServlet{
	
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		try
		{
			String mail=req.getParameter("mail");
			int id=Integer.parseInt(req.getParameter("num").toString());
			String group=req.getParameter("group");

		    String url = "jdbc:postgresql://localhost:5432/postgres";
	        String user = "postgres";
	        String password = "surya1134";
	        try
	        {
	        	Connection con = DriverManager.getConnection(url, user, password);
	        	PreparedStatement stmt=con.prepareStatement("select * from selected_persons where owner_id = ? and group_name = ? and email = ?");
	        	ResultSet rst;
	        	Statement st = con.createStatement();
	        	stmt.setInt(1, id);

	        	stmt.setString(2, group);

	        	stmt.setString(3, mail);

	        	rst=stmt.executeQuery();
	        	int t=0;
	        	if(rst.next()==true)
	        	{
	        		t=1;
	        	}
	        	if(t==1)
	        	{

	        		res.getWriter().write("Already Registered");
	        	}
	        }
	        catch(Exception e)
	        {
	        	
	        }
	      
		}
		catch(Exception e)
		{
			
		}
		
	}
	
}
