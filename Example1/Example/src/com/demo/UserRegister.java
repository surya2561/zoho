package com.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserRegister extends HttpServlet{

	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String name=req.getParameter("uname");
		String psw=req.getParameter("psw");

		PrintWriter out=res.getWriter();
		out.print("hello");
		final String url = "jdbc:postgresql://localhost:5432/postgres";
		final String user = "postgres";
		final String password = "surya1134";
	
		out.print("world");
		try {
			Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","surya1134");
			out.print("world");
			Statement st = con.createStatement();
			out.print("happy");
			PreparedStatement stmt=con.prepareStatement("insert into user_register(name,password) values(?,?)");
			out.print("to");
			stmt.setString(1, name);
			stmt.setString(2, psw);
			out.print("see");
			stmt.executeUpdate();
			out.print("you");
			String message="SuccessFully Registered And Wait for the approval from the admin";
			res.sendRedirect("./UserLogin.jsp?message="+URLEncoder.encode(message,"UTF-8") );
	
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
	}
}
