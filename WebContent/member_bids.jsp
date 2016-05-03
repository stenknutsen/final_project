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
<title>Insert title here</title>
</head>
<body>
	<h1>Current Bids</h1>

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/proj2016?autoReconnect=true&useSSL=false"
		user="root" password="ThereDKLD82" />

	<sql:query dataSource="${snapshot}" var="result"> SELECT DISTINCT auction.current_highest_bid, game.title, bid.offer, bid.autobid, bid.time_placed FROM bid, bid_history, auction, item, game WHERE bid.username='<%=session.getAttribute("userid")%>' and auction.item_id = item.item_id and item.upc_code = game.upc_code and bid_history.bid_id = bid.bid_id and bid_history.auction_id = auction.auction_id </sql:query>
	<table border="1" width="100%">
		<tr>
			<th>Bid Placed</th>
			<th>Offer</th>
			<th>Autobid</th>
			<th>Auctions Current Bid</th>
			<th>Title</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.time_placed}" /></td>
				<td><c:out value="${row.offer}" /></td>
				<td><c:out value="${row.autobid}" /></td>
				<td><c:out value="${row.current_highest_bid}" /></td>
				<td><c:out value="${row.title}" /></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
