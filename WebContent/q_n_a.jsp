<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.lang.*"%>
<%
    String subj = request.getParameter("sel");//subject selection    
    String question = request.getParameter("Text1");//question
    String src = (String)session.getAttribute("userid");//sender
	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");
    //VM MySQL pwd: ThereDKLD82
    Statement st = con.createStatement();
    

   int i =  st.executeUpdate("INSERT INTO questions(question_id, src, subject, q_text, a_text, helpful) VALUES(NULL,'"+src+"','"+subj+"','"+question+"','Answer Pending',0)");
    
    if (i>0){
    	response.sendRedirect("member_question_sent.jsp");
    }else{
    	response.sendRedirect("success.jsp");
    }
    
  
%>