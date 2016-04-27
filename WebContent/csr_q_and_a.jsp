<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
    <head>
        <title>CSR Q and A</title>
    </head>

    <body>
        <h1>Unanswered CSR Q and A</h1>

        <% 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");

            Statement st = con.createStatement();
            String src = (String)session.getAttribute("userid");
            ResultSet resultset = 
                st.executeQuery("SELECT * FROM questions where questions.a_text ='Answer Pending'") ; 
        %>

        <table BORDER="1">
            <tr>
                <th>ID</th>
                <th>Sender</th>
                <th>Subject</th>
                <th>Question</th>
                
            </tr>
            <% while(resultset.next()){ %>
            <tr>
            	<td> <%= resultset.getString(1) %></td>
                <td> <%= resultset.getString(2) %></td>
                <td> <%= resultset.getString(3) %></td>
                <td> <%= resultset.getString(4) %></td>
                
            </tr>
            <% } %>
        </table>
        
        
        
       <form method="post" action="csrqa.jsp">
			<p>Enter Number of question you want to respond to:<input type="text" name="q_id" value="" /></p>
			<p>Enter your answer here (140 char limit)</p>
			<textarea name="Text1" cols="40" rows="5"></textarea>
			<input type="submit" value="Submit Answer" />
			</form>
        <a href='customer_service_rep.jsp'>Go Back to CSR Home Page</a>
    </body>
</html>