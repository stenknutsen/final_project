<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>

You are not logged in. <a href="index.jsp">Please Login Here</a>

<%
} else {
%>

Welcome to the Customer Service Rep. Success page, <%=session.getAttribute("userid")%> ! <a href='logout.jsp'>Logout Here</a>
<br><br>
<a href='customer_service_rep.jsp'>Go to main Customer Service Rep. Page Here</a>

<%
  }
%>