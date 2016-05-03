<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--Code Contributors: Ben Homa --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Current Items For Auction</title>
</head>
<body>
<h1>Auctions</h1>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/proj2016?autoReconnect=true&useSSL=false"
		user="root" password="ThereDKLD82" />

	<sql:query dataSource="${snapshot}" var="result"> SELECT DISTINCT game.title, auction.auction_id, auction.date_created, auction.auto_sale_price, auction.current_highest_bid FROM auction, item, game WHERE auction.seller_id='<%=session.getAttribute("userid")%>' and auction.item_id = item.item_id and item.upc_code = game.upc_code </sql:query>

	<table border="1" width="100%">
		<tr>
			<th>Auction ID</th>
			<th>Date Created</th>
			<th>Auto Sale Price</th>
			<th>Current Highest Bid</th>
			<th>Game Title</th>

		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.auction_id}" /></td>
				<td><c:out value="${row.date_created}" /></td>
				<td><c:out value="${row.auto_sale_price}" /></td>
				<td><c:out value="${row.current_highest_bid}" /></td>
				<td><c:out value="${row.title}" /></td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>
