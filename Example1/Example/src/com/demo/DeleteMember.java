package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteMember extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res)
	{

		try
		{
			String email=req.getParameter("email");
		
			int id=Integer.parseInt(req.getParameter("id"));
			String gname=req.getParameter("gname");
			try
			{
				String url = "jdbc:postgresql://localhost:5432/postgres";
				String user = "postgres";
				String password = "surya1134";
				Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement st;
				st=con.prepareStatement("update selected_persons set delete=1 where email = ? and group_name = ? and owner_id = ?");
				st.setString(1, email);
				st.setString(2, gname);
				st.setInt(3, id);
				st.executeUpdate();
				res.sendRedirect("./viewgroup.jsp?group="+gname+"&id="+id);
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
