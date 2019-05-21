package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaveUsers extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		try
		{
			String name[]=req.getParameterValues("name");
			String email[]=req.getParameterValues("email");
			
			String owner_name=req.getParameter("UserName");
			String group=req.getParameter("group");
			int owner_id=Integer.parseInt(req.getParameter("UserId"));
			
			
			String url = "jdbc:postgresql://localhost:5432/postgres";
	        
	        String user = "postgres";
	        
	        String password = "surya1134";

	        
	        try
	            {
	            	
	            	Connection con = DriverManager.getConnection(url, user, password);
	            	PreparedStatement stmt=con.prepareStatement("insert into selected_persons(name,email,owner_id,group_name) values (?,?,?,?)" );
	            	int test=0;
	            	for(int i=0;i<name.length;i++)
	            	{
	            		PreparedStatement stm=con.prepareStatement("select * from selected_persons where owner_id = ? and delete = 0");
		            	
		            	stm.setInt(1,owner_id);
		            	ResultSet rst=stm.executeQuery();
	            		test=0;
	            		while(rst.next())
	            		{
	            			if(rst.getString("email").equals(email[i]) && rst.getString("group_name").equals(group))
	            			{
	            				test=1;
	            			}
	            		}
	            	     if(test==0)
	            	     {
	            	    	stmt.setString(1, name[i]);

	                    	stmt.setString(2, email[i]);

	                    	stmt.setInt(3, owner_id);
	                    	
	                    	stmt.setString(4, group);
	                    	
	                    	stmt.executeUpdate();
	            	     }
	            	}
	            	res.sendRedirect("./SelectUsers.jsp?name="+owner_name+"&id="+owner_id);
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
