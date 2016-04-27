<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.lang.*"%>
<%
    String subj = request.getParameter("sel");//subject selection    
    
    String src = (String)session.getAttribute("userid");//sender
	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");
    //VM MySQL pwd: ThereDKLD82
    Statement st = con.createStatement();
    
    ResultSet resultset = 
            st.executeQuery("SELECT * FROM questions where questions.a_text !='Answer Pending' AND questions.subject='"+subj+"'") ;
    
    
%>

<table BORDER="1">
            <tr>
                <th>Username</th>
                <th>Subject</th>
                <th>Question</th>
                <th>Answer</th>
            </tr>
            <% while(resultset.next()){ %>
            <tr>
                <td> <%= resultset.getString(2) %></td>
                <td> <%= resultset.getString(3) %></td>
                <td> <%= resultset.getString(4) %></td>
                <td> <%= resultset.getString(5) %></td>
            </tr>
            <% } %>
        </table>
<a href='view_q_and_a.jsp'>Go Back to Previous Page</a>
        
        
        
        
        