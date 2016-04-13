<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>

You are not logged in. <a href="index.jsp">Please Login Here</a>

<%
} else {
%>

Welcome to the Admin Success page, <%=session.getAttribute("userid")%> ! <a href='logout.jsp'>Logout Here</a>
<br><br>
<a href='administrator.jsp'>Go to main Administrator Page Here</a>

<%
  }
%>