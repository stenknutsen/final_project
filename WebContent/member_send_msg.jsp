<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.lang.*"%>
<%
    String dest = request.getParameter("uname");    
    String msg = request.getParameter("Text1");
    String src = (String)session.getAttribute("userid"); 
	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");
    //VM MySQL pwd: ThereDKLD82
    Statement st = con.createStatement();
    
   int i =  st.executeUpdate("INSERT INTO messages(message_id, src, dest, msg_text) VALUES(NULL,'"+src+"','"+dest+"','"+msg+"')");
    
    
    if (i>0){
    	response.sendRedirect("member_message_sent.jsp");
    }else{
    	response.sendRedirect("success.jsp");
    }
    
  
%>