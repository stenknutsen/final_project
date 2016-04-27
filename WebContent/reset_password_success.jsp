<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reset Member Password Success</title>
</head>
<body>
<h1>Password Reset Successful!</h1>
<h2>The following message was sent to <%=session.getAttribute("member_uname")%> :</h2>

Your new Password is: <%=session.getAttribute("member_pwd")%> <br><br>

<a href='customer_service_rep.jsp'>Go back to CSR Main Page</a>
</body>
</html>