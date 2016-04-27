<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<html>
    <head>
        <title>Q and A with CSR</title>
    </head>

    <body>
        <h1>CSR Q and A</h1>
<form method="post" action="vqna.jsp">
        <% 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");

            Statement st = con.createStatement();
            String src = (String)session.getAttribute("userid");
            ResultSet resultset = 
                st.executeQuery("SELECT * FROM questions where questions.a_text !='Answer Pending'") ; 
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
        
              
               
              
                  
                      <p>Filter by Subject:</p>
                      <select name="sel">
							<option value="purchases">Purchases</option>
							<option value="returns">Returns</option>
							<option value="payment">Payment</option>
							<option value="account">Account</option>
						</select>
						<br>
					
                      <input type="submit" value="Submit" />
                     
                  
                    
            
          
 </form>       
        <a href='success.jsp'>Go Back to Previous Page</a>
    </body>
</html>