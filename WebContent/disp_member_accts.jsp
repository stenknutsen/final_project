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
        <h1>Member Accounts</h1>

        <% 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");

            Statement st = con.createStatement();
            ResultSet resultset = 
                st.executeQuery("SELECT * FROM account WHERE account.username NOT IN (SELECT admin_id FROM admin_account) AND account.username NOT IN (SELECT csr_id FROM csr_account)") ;//temporary -- will be joined with member_accounts 
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
        <a href='customer_service_rep.jsp'>Go Back to CSR Page</a>
    </body>
</html>