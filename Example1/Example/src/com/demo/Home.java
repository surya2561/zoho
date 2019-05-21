package com.demo;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Home extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res)
	{
		String v= String.valueOf(req.getParameter("uname"));
		String r= String.valueOf(req.getParameter("psw"));
		
		
			try {
			if(v.equals("surya") && r.contentEquals("surya1134"))
			{
			req.setAttribute("UserName", "surya");
			RequestDispatcher dispatcher = req.getRequestDispatcher("./Admin.jsp");
         	dispatcher.forward(req, res);
            }
			else
			{
				String message="UserName or PassWord Invalid";

				res.sendRedirect("./index.jsp?message="+URLEncoder.encode(message,"UTF-8") );
				
			}
			}
			catch(Exception e)
			{
				
			}
		
	}
}
