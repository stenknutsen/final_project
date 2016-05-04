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
	<form action="search_buy_bid.jsp">
	<br>
	<input type ="submit" name ="Buy Now" value="Buy Now"/>
	<input type="text" name="auction_id_1" value="Enter Auction ID"/>
	<input type="submit" name ="Place Bid" value="Place Bid"/>
	<input type="text" name="auction_id_2" value="Enter Auction ID"/>
	<input type="text" name="bid_price" value="Enter Bid Price"/>
	<br>
	<input type="radio" name="autobid" value="Yes"/> Auto Bid 
	<input type="text" name="autobid_limit" value="Enter Max Auto Bid"/>
	<br>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/proj2016?autoReconnect=true&useSSL=false"
		user="root" password="ThereDKLD82" />

	<sql:query dataSource="${snapshot}" var="result"> SELECT * FROM game, item, auction WHERE game.title = '<%=session.getAttribute("game")%>' AND item.item_condition = '<%=session.getAttribute("condition")%>' AND game.system = '<%=session.getAttribute("system")%>' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id; </sql:query>

	<table border="1" width="100%">
		<tr>
			<th>upc_code</th>
			<th>Title</th>
			<th>System</th>
			<th>Rating</th>
			<th>Genre</th>
			<th>Bid Price</th>
			<th>Buy Now Price</th>
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
			</tr>
		</c:forEach>
	</table>
	</form>
</body>
</html>