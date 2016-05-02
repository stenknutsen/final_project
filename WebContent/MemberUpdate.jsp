<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%

	String username = (String)session.getAttribute("userid");
	String FirstName = request.getParameter("fname");
	String LastName = request.getParameter("lname");
	String Email = request.getParameter("email");
	String Password = request.getParameter("pass");

 Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");
    //VM MySQL pwd: ThereDKLD82
    Statement st = con.createStatement();

    ResultSet rs;
   	String update_request = "UPDATE account SET password='" + Password + "', first_name='" + FirstName + "', last_name='"
    + LastName + "', email='" + Email + "' WHERE username='"+username+"'";
    int i = st.executeUpdate(update_request);

    if (i > 0) {

        response.sendRedirect("member_update_success.jsp");

    } else {
        response.sendRedirect("index.jsp");
    }

%>
