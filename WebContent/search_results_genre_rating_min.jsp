<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--Code Contributors: Karl Capili --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>Search Results</title>
</head>
<body>
	<h1>Found Results</h1>

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/proj2016?autoReconnect=true&useSSL=false"
		user="root" password="ThereDKLD82" />

	<sql:query dataSource="${snapshot}" var="result"> SELECT * FROM game, item, auction WHERE game.genre = '<%=session.getAttribute("genre")%>' AND game.rating = '<%=session.getAttribute("rating")%>' AND (auction.auto_sale_price BETWEEN '<%=session.getAttribute("min_price")%>' AND 100000000000 OR auction.current_highest_bid BETWEEN '<%=session.getAttribute("min_price")%>' AND 100000000000) AND item.item_condition = '<%=session.getAttribute("condition")%>' AND game.system = '<%=session.getAttribute("system")%>' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id; </sql:query>

	<table border="1" width="100%">
		<tr>
			<th>upc_code</th>
			<th>Title</th>
			<th>System</th>
			<th>Rating</th>
			<th>Genre</th>
			<th>Bid Price</th>
			<th>Buy Now Price</th>
			<th>Action</th>
			<th>Action</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.upc_code}" /></td>
				<td><c:out value="${row.title}" /></td>
				<td><c:out value="${row.system}" /></td>
				<td><c:out value="${row.rating}" /></td>
				<td><c:out value="${row.genre}" /></td>
				<td><c:out value="${row.current_highest_bid}" /></td>
				<td><c:out value="${row.auto_sale_price}" /></td>
				<td><a href="success.jsp"><button type ="button">Buy Now</button></a></td>
				<td><a href="success.jsp"><button type ="button">Place Bid</button></a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>