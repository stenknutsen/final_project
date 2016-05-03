<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%--Code Contributors: Ben Homa --%>
<%@ page import="java.sql.*"%>
<%

	String username = (String)session.getAttribute("userid");
	String upc = request.getParameter("UPC");
	String title = request.getParameter("Game");
	String genre = request.getParameter("Genre");
	String rating = request.getParameter("Rating");
	String bidprice = request.getParameter("Bid Price");
	String sellprice = request.getParameter("Sell Price");
	String system = request.getParameter("Xbox");
	String condition = request.getParameter("Condition");
	String time = request.getParameter("Date");

	Integer timeint = Integer.parseInt(time);
	Integer item = 12, aid = 0, sold = 0;
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016", "root", "ThereDKLD82");
	Statement st = con.createStatement();
	ResultSet rs,item_id,a_id;

	rs = st.executeQuery("select Max(game.units_sold) from game where game.title='"+title+"' and game.system='"+system+"'");
    item_id = st.executeQuery("select Max(item.item_id) from item");
	a_id = st.executeQuery("select Max(auction.auction_id) from auction");

    if(rs.next()) {
		item = item_id.getInt("Max(item.item_id)");
		item++;
		aid = a_id.getInt("Max(auction.auction_id)");
		aid++;
		sold = rs.getInt("Max(game.units_sold)");
		sold++;
	}

	if(!bidprice.equals("") && !sellprice.equals("") && !title.equals("") && !upc.equals("")) {
		int i = st.executeUpdate(
				"insert into Game(upc_code, title, system, rating, genre, units_sold) values ('"
						+ upc + "','" + title + "','" + system + "','" + rating + "','" + genre + "','"+sold);

		int x = st.executeUpdate("insert into Item(item_id, min_price, item_condition, upc_code) values ('"
				+ item + "','" + bidprice + "','" + condition + "','" + upc);

		int y = st.executeUpdate(
				"insert into Auction(auction_id, hours_open, sale_price, current_highest_bid, item_id, seller_id) values ('"
						+aid+ "','"+ timeint +"','"+sellprice+"','"+0+"','"+item+"','"+username);


		if (i > 0 && x > 0 && y > 0) {

			response.sendRedirect("postSellSucess.jsp");

		} else {
			response.sendRedirect("postSellFail.jsp");
		}
	}
		else {
		response.sendRedirect("postSellFail.jsp");
	}
%>
