package com.demo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckUser extends HttpServlet{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		String uname= String.valueOf(req.getParameter("uname"));
		String psw= String.valueOf(req.getParameter("psw"));
		String url = "jdbc:postgresql://localhost:5432/postgres";
		String user = "postgres";
        String password = "surya1134";
        Connection con;
        try
        {
        	con = DriverManager.getConnection(url, user, password);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from user_register");
            while (rs.next()) {
           		  if(uname.equals(rs.getString("name")) && rs.getInt("approve") == 1)
                   {
         		  req.setAttribute("UserName", uname);
         		  req.setAttribute("UserId", rs.getInt("id"));
         		  RequestDispatcher dispatcher = req.getRequestDispatcher("./User.jsp");
                  dispatcher.forward(req, res);
                   }
            }
        }
        catch(Exception e)
        {
        	
        }
        res.sendRedirect("./UserLogin.jsp");
      }

}
