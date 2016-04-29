<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%
    String user = request.getParameter("uname");    
    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");
    //VM MySQL pwd: ThereDKLD82
    Statement st = con.createStatement();
    
    ResultSet rs;
   
    
    int i = st.executeUpdate("delete from account where username='"+user+"'");
   
    if (i > 0) {
        
        response.sendRedirect("csr_creation_success.jsp");
      
    } else {
        response.sendRedirect("administrator.jsp");
    }
    
%>