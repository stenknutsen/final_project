<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
   
	String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "pottedmeat");
  //VM MySQL pwd: ThereDKLD82
    Statement st = con.createStatement();
    
    ResultSet rs;
    rs = st.executeQuery("select * from account where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        response.sendRedirect("success.jsp");
    } 
    else 
    {
        out.println("Invalid entry: <a href='index.jsp'>please try again</a>");
    }
%>