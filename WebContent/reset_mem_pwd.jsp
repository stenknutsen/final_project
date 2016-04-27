<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.lang.*"%>
<%
	
    String csr_id = (String)session.getAttribute("userid");
    String pwd = request.getParameter("pass");
    session.setAttribute("member_pwd", pwd);
    //String fname = request.getParameter("fname");
    String username = request.getParameter("uname");
    session.setAttribute("member_uname", username);
    //String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");
    //VM MySQL pwd: ThereDKLD82
    Statement st = con.createStatement();
    
    ResultSet rs;
    String update_request = "UPDATE account SET password='" + pwd + "' WHERE username='"+username+"'";
    st.executeUpdate("INSERT INTO messages(message_id, src, dest, msg_text) VALUES(NULL,'CUSTOMER SERVICE','"+username+"','Your new Password is: "+pwd+"')");
    
    
    int i = st.executeUpdate(update_request);
    
   if (i > 0) {
        
        response.sendRedirect("reset_password_success.jsp");//change
      
    } else {
        response.sendRedirect("index.jsp");//change
    }
    
%>