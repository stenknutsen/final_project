<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
    <head>
        <title>List CSR Table</title>
    </head>

    <body>
        <h1>Customer Service Representatives</h1>

        <% 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");

            Statement st = con.createStatement();
            ResultSet resultset = 
                st.executeQuery("SELECT * FROM account NATURAL JOIN csr_account where account.username = csr_account.csr_id") ; 
        %>

        <table BORDER="1">
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>F_Name</th>
                <th>L_Name</th>
                <th>Email</th>
                <th>Date_Reg</th>
            </tr>
            <% while(resultset.next()){ %>
            <tr>
                <td> <%= resultset.getString(1) %></td>
                <td> <%= resultset.getString(2) %></td>
                <td> <%= resultset.getString(3) %></td>
                <td> <%= resultset.getString(4) %></td>
                <td> <%= resultset.getString(5) %></td>
                <td> <%= resultset.getString(6) %></td>
            </tr>
            <% } %>
        </table>
        <a href='administrator.jsp'>Go Back to Administrator Page</a>
    </body>
</html>