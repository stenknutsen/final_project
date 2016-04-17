<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>