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
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>


<html>
<head>
<title>Search Results</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css" />
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
 
	<sql:query dataSource="${snapshot}" var="result"> SELECT * FROM game, item, auction WHERE game.genre = '<%=session.getAttribute("genre")%>' AND game.rating = '<%=session.getAttribute("rating")%>'AND (auction.auto_sale_price BETWEEN 0 AND <%=session.getAttribute("max_price")%> OR auction.current_highest_bid BETWEEN 0 AND <%=session.getAttribute("max_price")%>)  AND game.system = '<%=session.getAttribute("system")%>' AND item.item_condition = '<%=session.getAttribute("condition")%>' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id; </sql:query>

	
		<display:table uid="${auction_id}" name="${result.rows}" pagesize="5"
			cellpadding="0px" cellspacing="0px">
			<display:setProperty name="basic.show.header" value="true"/>
			<display:column property="auction_id" sortable="true"
				headerClass="sortable" />
			<display:column property="title" sortable="true"
				headerClass="sortable" />
			<display:column property="system" sortable="true"
				headerClass="sortable" />
			<display:column property="genre" sortable="true"
				headerClass="sortable" />
			<display:column property="rating" sortable="true"
				headerClass="sortable" />
			<display:column property="current_highest_bid" sortable="true"
				headerClass="sortable" />
			<display:column property="auto_sale_price" sortable="true"
				headerClass="sortable" />
		</display:table>
	</form>
</body>
</html>