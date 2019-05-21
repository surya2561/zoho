package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlGeneration extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		try {
			String url = "jdbc:postgresql://localhost:5432/postgres";
	        String user = "postgres";
	        String password = "surya1134";
			StringBuilder id_num=new StringBuilder();
			StringBuilder data = new StringBuilder();
			String sports[]=req.getParameterValues("check");
			String name=req.getParameter("name");
			int id=Integer.parseInt(req.getParameter("id"));

			Connection con = DriverManager.getConnection(url, user, password);
        	Statement st = con.createStatement();
        	ResultSet rst;
			for(int i=0;i<sports.length;i++) {
				int g=Integer.parseInt(sports[i]);
				try
				{
		        	PreparedStatement stmt=con.prepareStatement("select * from persons where id = ?");
		        	
		        	stmt.setInt(1, g);
		        	rst = stmt.executeQuery();
					while(rst.next())
					{
						
					    data.append(rst.getString("name"));
					}
					if(i<sports.length-1)
					{
				       data.append(',');
					}
				}
				catch(Exception e)
				{
					
				}
			}
			String d=data.toString();
			for(int i=0;i<sports.length;i++)
			{
			id_num.append(sports[i]);
			if(i<sports.length-1)
			{
				id_num.append(',');
			}
			}
			String result=id_num.toString();
			
	        try
	        {
	        	ResultSet rs = st.executeQuery("select * from list");
	        	while (rs.next())
	        	{
	        	if(rs.getInt("id")==id)
	        	{
		        	PreparedStatement stmt=con.prepareStatement("delete from list where id = ?");
		        	stmt.setInt(1, rs.getInt("id"));
		        	stmt.executeUpdate();  
	        	}
	        	}
	        	PreparedStatement stmt=con.prepareStatement("insert into list(id,name,user_ids,UserNames) values(?,?,?,?)");
	        	
	        	stmt.setInt(1, id);
	        	stmt.setString(2,name);
	        	stmt.setString(3, result);
	        	stmt.setString(4, d);
	        	int i=stmt.executeUpdate();  
	        	System.out.println(i+" records updated");
	        	req.setAttribute("UserName", name);
	        	req.setAttribute("UserId", id);
	        	RequestDispatcher dispatcher = req.getRequestDispatcher("./User.jsp");
	         	dispatcher.forward(req, res);
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