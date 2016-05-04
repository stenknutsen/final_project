<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--Code Contributors: Ben Homa & Karl Capili --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member Page</title>
</head>
<body>

<h1>Welcome <%=session.getAttribute("userid")%> to your home page</h1>

<div>
<form method="post" action="member.jsp">
	<a href="UpdateMember.jsp"><button type="button">Update Account</button></a>
	<a href="postSell.jsp"><button type ="button">Sell Item</button></a>
	<a href="buy_page.jsp"><button type ="button">Buy Item</button></a>
	<a href="search_page.jsp"><button type ="button">Search Item </button></a>
	<a href="member_items_selling.jsp"><button type="button">Check On Items Selling</button></a>
	<a href="member_bids.jsp"><button type="button">Check On Bids</button></a>
	<a href="member_update_details.jsp"><button type="button">Add Credit Card</button></a>
	<a href="member_similiar.jsp"><button type="button">Search for similiar items</button></a>

 </form>
</div>


</body>
</html>
