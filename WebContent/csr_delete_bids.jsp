<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
    <head>
        <title>Delete Bid</title>
    </head>

    <body>
        <h1>Delete Auction</h1>

        <% 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");

            Statement st = con.createStatement();
            String src = (String)session.getAttribute("userid");
            ResultSet resultset = 
                st.executeQuery("SELECT * FROM demo_bids") ; 
        %>

        <table BORDER="1">
            <tr>
                <th>Bid ID</th>
                <th>Bidder</th>
                
                
            </tr>
            <% while(resultset.next()){ %>
            <tr>
            	<td> <%= resultset.getString(1) %></td>
                <td> <%= resultset.getString(2) %></td>
               
                
            </tr>
            <% } %>
        </table>
        
        
        
       <form method="post" action="csrdb.jsp">
			<p>Enter Number of Bid you want to delete:<input type="text" name="q_id" value="" /></p>
			<input type="submit" value="Submit Answer" />
			</form>
        <a href='customer_service_rep.jsp'>Go Back to CSR Home Page</a>
    </body>
</html>