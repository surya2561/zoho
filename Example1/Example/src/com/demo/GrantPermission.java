package com.demo;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GrantPermission extends HttpServlet{
	
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
        		ArrayList<String>temp1=new ArrayList<String>();
        		ArrayList<String>temp2=new ArrayList<String>();
        		ArrayList<Integer>exist_id=new ArrayList<Integer>();
        		ArrayList<Integer>current_id=new ArrayList<Integer>();
        		ArrayList<String>exist_group=new ArrayList<String>();
        		ArrayList<String>current_group=new ArrayList<String>();
        	    ArrayList<String>group=new ArrayList<String>();
        		ArrayList<Integer>numbers=new ArrayList<Integer>();
        		ArrayList<Integer>id_val=new ArrayList<Integer>();
        		ArrayList<String>req_person=new ArrayList<String>();
        		ArrayList<String>group_persons=new ArrayList<String>();
        		
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
        		for(int i=0;i<arr.length;i++)
	        	{
        			ResultSet rs = st.executeQuery("select * from selected_persons where approve = 1 and delete = 0");
        			PreparedStatement stm=con.prepareStatement("select * from selected_persons where owner_id = ? and group_name = ? and approve = 0 and delete = 0");
        			stm.setInt(1, arr[i]);
        			stm.setString(2, str[i]);
        			rst=stm.executeQuery();
        			while(rst.next())
        			{
        				temp1.add(rst.getString("email"));
        			}
        			while(rs.next())
        			{
        				temp2.add(rs.getString("email"));
        				id_val.add(rs.getInt("owner_id"));
        				group_persons.add(rs.getString("group_name"));
        			}
        			
        			int check=0,member_id=0,k=0,var=0;
        			for(int itr1=0;itr1<temp1.size();itr1++)
        			{
        				k=0;
        				for(int itr2=0;itr2<temp2.size();itr2++)
        				{
        					if(temp1.get(itr1).equals(temp2.get(itr2)) == true)
        					{
        						current_id.add(arr[i]);//add current id
        						current_group.add(str[i]);//add current group
        						req_person.add(temp1.get(itr1));
        						exist_id.add(id_val.get(itr2));//add existing id
        						exist_group.add(group_persons.get(itr2));//add existing group
        						
        						k=1;
        						c=1;
        						check=1;
        						break;
          					}
        				}
        			}
        			if(check==0)
    				{
    					PreparedStatement stmt=con.prepareStatement("update selected_persons set approve = 1 where owner_id = ? and group_name = ?");
    					stmt.setInt(1, arr[i]);
    					stmt.setString(2, str[i]);
    					stmt.executeUpdate();
    				}
        			
		            temp1.clear();
		            temp2.clear();
		            
        			
	        	}
        		if(c==1)
        		{
        		    req.setAttribute("current_id_list", current_id);
        		    req.setAttribute("current_group_list", current_group);
        		    req.setAttribute("req_persons", req_person);
        		    req.setAttribute("exist_id_list", exist_id);
        		    req.setAttribute("exist_group_list", exist_group);
        	    	req.setAttribute("UserName", name);
        			req.getRequestDispatcher("./Admin.jsp").forward(req, res);
        		}
        	}
	        catch(Exception e)
	        {
	        	
	        }
	    	req.setAttribute("UserName", name);
	    	req.getRequestDispatcher("./Admin.jsp").forward(req, res);
		}
		catch(Exception e)
		{
			
		}
      }
}