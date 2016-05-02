<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Ben Homa -->
<%
	String username = (String)session.getAttribute("userid");
    String credit = request.getParameter("Credit");
    String address = request.getParameter("Street");
    String city = request.getParameter("City");
    String zip = request.getParameter("Zip");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");

    Statement st = con.createStatement();

    ResultSet rs;
   	String update_request = "UPDATE member_account SET street_address='" + address + "', city='" + city + "', zip='" + zip +
   			"', credit_card_number='" + credit + "' WHERE username'"+username+"'";
    int i = st.executeUpdate(update_request);

    if (i > 0) {

        response.sendRedirect("member_update_success.jsp");

    } else {
        response.sendRedirect("member_update_fail.jsp");
    }

%>
