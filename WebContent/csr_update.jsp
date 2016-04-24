<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.lang.*"%>
<%
    String username = (String)session.getAttribute("userid");
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");
    //VM MySQL pwd: ThereDKLD82
    Statement st = con.createStatement();
    
    ResultSet rs;
   	String update_request = "UPDATE account SET password='" + pwd + "', first_name='" + fname + "', last_name='" + lname +
   			"', email='" + email + "' WHERE username='"+username+"'";
    int i = st.executeUpdate(update_request);
    
    if (i > 0) {
        
        response.sendRedirect("csr_update_success.jsp");
      
    } else {
        response.sendRedirect("index.jsp");
    }
    
%>