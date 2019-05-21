package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckGroups extends HttpServlet{
	
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		try
		{
		String group=req.getParameter("group");
	
		int id=Integer.parseInt(req.getParameter("num").toString());
		String url = "jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String password = "surya1134";
        try
        {
        	Connection con = DriverManager.getConnection(url, user, password);
        	PreparedStatement stmt=con.prepareStatement("select * from selected_persons where group_name = ? and owner_id = ?");
        	ResultSet rst;
        	
        	stmt.setString(1, group);

        	stmt.setInt(2, id);
        	rst=stmt.executeQuery();
        	
        	int t=0;
        	if(rst.next()==true)
        	{
        		t=1;
        	}
        	if(t==1)
        	{	

        		res.getWriter().write("This Group Was Already Created By You Click Okay To View The Group");
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
