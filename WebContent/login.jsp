<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import ="java.sql.*" %>
<%
   
	String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "pottedmeat");
  //VM MySQL pwd: ThereDKLD82
    Statement st = con.createStatement();
    
    ResultSet rs, rs2;
    
    //first see if person logging as an admin account
    rs2 = st.executeQuery("SELECT * FROM account NATURAL JOIN admin_account WHERE username='" + userid + "' and password='" + pwd + "' AND account.username = admin_account.admin_id");
    if (rs2.next()) {
        session.setAttribute("userid", userid);
        response.sendRedirect("success_admin.jsp");
    } 
    else //see if just a normal account
    {
    	rs = st.executeQuery("select * from account where username='" + userid + "' and password='" + pwd + "'");
        
        
        if (rs.next()) {
            session.setAttribute("userid", userid);
            response.sendRedirect("success.jsp");
        } 
        else 
        {
            out.println("Invalid entry: <a href='index.jsp'>please try again</a>");
        }
    }
    
    
%>