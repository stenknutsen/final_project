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

Welcome <%=session.getAttribute("userid")%> ! <a href='logout.jsp'>Logout Here</a>
<br>
<a href='memberpage.jsp'>Go to Your Member Home Page Here</a>
<%
  }
%>