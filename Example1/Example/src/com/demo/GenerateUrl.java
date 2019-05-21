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

public class GenerateUrl extends HttpServlet{
	
	public void service(HttpServletRequest req, HttpServletResponse res)
	{
		try {
			String n=req.getParameter("UserName");			
			StringBuilder id_num=new StringBuilder();
			String sports[]=req.getParameterValues("check");;
			int k=0;
		   
			String sports1[]=req.getParameterValues("check1");
			
			String name=req.getParameter("name");
			String id1=req.getParameter("id");
		
			int id=Integer.parseInt(req.getParameter("id"));
		
			String url = "jdbc:postgresql://localhost:5432/postgres";
			
	        String user = "postgres";
	        
	        String password = "surya1134";
	       

	        try
	        {
	        	
	        	Connection con = DriverManager.getConnection(url, user, password);
	        	
	        	if(sports!=null)
	        	{
	        	for(int i=0;i<sports.length;i++)
	        	{
	        	
		        PreparedStatement stmt=con.prepareStatement("update user_register set approve=1 where id = ?" );
	        	stmt.setInt(1, Integer.parseInt(sports[i]));
	            stmt.executeUpdate();
		        }
	        	}
	        	if(sports1!=null)
	        	{
	        	for(int i=0;i<sports1.length;i++)
	        	{
	        	PreparedStatement stmt=con.prepareStatement("delete from user_register where id = ?" );
	        	stmt.setInt(1, Integer.parseInt(sports1[i]));
	            stmt.executeUpdate();
	        	}
	        	}
	        }
	        catch(Exception e)
	        {
	        	
	        }
	    	req.setAttribute("UserName", n);
	    	RequestDispatcher dispatcher = req.getRequestDispatcher("./Admin.jsp");
         	dispatcher.forward(req, res);	    	
		}
		catch(Exception e)
		{
			
		}
	}

}
