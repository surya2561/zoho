package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteGroup extends HttpServlet{
	
		 public static boolean isInteger(String s) {
		      boolean isValidInteger = false;
		      try
		      {
		         Integer.parseInt(s);
		 
		         // s is a valid integer
		 
		         isValidInteger = true;
		      }
		      catch (NumberFormatException ex)
		      {
		         // s is not an integer
		      }
		 
		      return isValidInteger;
		   }
		
		public void service(HttpServletRequest req,HttpServletResponse res)
		{
			try {
				String sports[]=req.getParameterValues("check");
				
				String url = "jdbc:postgresql://localhost:5432/postgres";
		        String user = "postgres";
		        String password = "surya1134";
		        String name=req.getParameter("UserName");
		        try
		        {
		        	Connection con = DriverManager.getConnection(url, user, password);

	        		Statement st = con.createStatement();

	        		ResultSet rst;
	        		
	        	    ArrayList<String>group=new ArrayList();
	        		ArrayList<Integer>numbers=new ArrayList();
	        		
	        		int c=0;
	        		
	        		for(int itr=0;itr < sports.length;itr++)
	        		{
	        			String []groups=sports[itr].split(",");
	        			for(int j=0;j<groups.length;j++)
	        			{
	        				boolean isInteger = isInteger(groups[j]);	
	        				if(isInteger)
	        				{
	        					numbers.add(Integer.parseInt(groups[j]));
	        				}
	        				else
	        				{
	        					group.add(groups[j]);
	        				}
	        			}
	        		}
	        		Integer[] arr = new Integer[numbers.size()];
	        		arr = numbers.toArray(arr); 
	        		String [] str=new String[group.size()];
	        		str=group.toArray(str);
	        		for(int i=0;i<str.length;i++)
	        		{
	        			PreparedStatement stmt=con.prepareStatement("update selected_persons set delete=1 where group_name = ? and owner_id = ?");
	        			stmt.setString(1, str[i]);
	        			stmt.setInt(2, arr[i]);
	        			stmt.executeUpdate();
	        			
	        		}
	        		req.setAttribute("UserName", name);
	    	    	req.getRequestDispatcher("./Admin.jsp").forward(req, res);
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
