<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
    <head>
        <title>Member Messages Inobx</title>
    </head>

    <body>
        <h1>Member Messages Inbox</h1>

        <% 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");

            Statement st = con.createStatement();
            String src = (String)session.getAttribute("userid");
            ResultSet resultset = 
                st.executeQuery("SELECT * FROM messages where messages.dest ='"+src+"'") ; 
        %>

        <table BORDER="1">
            <tr>
                <th>Sender</th>
                <th>Message</th>
                
            </tr>
            <% while(resultset.next()){ %>
            <tr>
                <td> <%= resultset.getString(2) %></td>
                <td> <%= resultset.getString(4) %></td>
                
            </tr>
            <% } %>
        </table>
        <a href='success.jsp'>Go Back</a>
    </body>
</html>