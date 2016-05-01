<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
    <head>
        <title>Sales Report</title>
    </head>

    <body>
        <h2>Best Buyers</h2>

        <% 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");

            Statement st = con.createStatement();
            String src = (String)session.getAttribute("userid");
            ResultSet resultset = 
                st.executeQuery("SELECT buyer, SUM(sale_price) from demo_sales group by buyer order by SUM(sale_price) desc;") ; 
        %>

        <table BORDER="1">
            <tr>
                <th>Buyer</th>
                <th>Total Purchases</th>
                
            </tr>
            <% while(resultset.next()){ %>
            <tr>
                <td> <%= resultset.getString(1) %></td>
                <td> <%= resultset.getString(2) %></td>
                
            </tr>
            <% } %>
        </table>
        <a href='administrator.jsp'>Go Back to Administrator Page</a>
    </body>
</html>