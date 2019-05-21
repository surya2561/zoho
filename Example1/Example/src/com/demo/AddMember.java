package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddMember extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		try
		{
			String email=req.getParameter("email");
			String name=req.getParameter("name");
			int id=Integer.parseInt(req.getParameter("id"));
			String gname=req.getParameter("gname");
			try
			{
				String url = "jdbc:postgresql://localhost:5432/postgres";
				String user = "postgres";
				String password = "surya1134";
				Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement st;
				st=con.prepareStatement("insert into selected_persons (name,email,owner_id,group_name) values (?,?,?,?)");
				st.setString(1, name);
				st.setString(2, email);
				st.setInt(3, id);
				st.setString(4, gname);
				st.executeUpdate();
				res.sendRedirect("./viewgroup.jsp?group="+gname+"&id="+id);
			}
			catch(Exception e)
			{
				res.sendRedirect("./viewgroup.jsp?group="+gname+"&id="+id);
			}
		}
		catch(Exception e)
		{
			
		}
	}

}
