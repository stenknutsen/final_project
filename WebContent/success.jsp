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
<a href='memberpage.jsp'>Go to Your Member Home Page Here</a><br><br>
<h2>Question and Answer</h2>
<a href='q_and_a.jsp'>Send Question to CSR Here</a><br>
<a href='view_q_and_a.jsp'>View Questions and Answers to CSR Here</a><br>
<h2>Messages</h2>
<a href='member_send_message.jsp'>Send A Message Here.</a><br>
<a href='member_sent_message.jsp'>View Sent Messages Here.</a><br>
<a href='member_inbox_message.jsp'>View Messages Inbox Here.</a><br><br>

<%
  }
%>