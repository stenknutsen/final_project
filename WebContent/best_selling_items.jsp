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
        <h2>Best Selling Items</h2>

        <% 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");

            Statement st = con.createStatement();
            String src = (String)session.getAttribute("userid");
            ResultSet resultset = 
                st.executeQuery("SELECT item_name, COUNT(sale_id) from demo_sales group by item_name order by COUNT(sale_id) desc;") ; 
        %>

        <table BORDER="1">
            <tr>
                <th>Title</th>
                <th>Total Units Sold</th>
                
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