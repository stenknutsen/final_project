<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen, Ben Homa --%>
<%
    String user = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
            "root", "ThereDKLD82");
    //VM MySQL pwd: ThereDKLD82
    Statement st = con.createStatement();

    ResultSet rs, ab;
    rs = st.executeQuery("select username from account where username='" + user + "'");

    if(rs.next()){

    	response.sendRedirect("not_welcome.jsp");
    }
    else
    {

    int i = st.executeUpdate("insert into account(username, password, first_name, last_name, email, regdate) values ('" + user + "','" + pwd + "','" + fname + "','" + lname + "','" + email + "', CURDATE())");
    int j = st.executeUpdate("insert into member_account(member_id) values ('"+user+"')");
    if (i > 0) {

        response.sendRedirect("welcome.jsp");

    } else {
        response.sendRedirect("index.jsp");
    }
    }
%>
