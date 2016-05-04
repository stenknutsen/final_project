<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--Code Contributors: Karl Capili --%>
<%@ page import="java.sql.*"%>

<%
	if (request.getParameter("Place Bid") != null) {
		String error_page = "search_buy_bid_error.jsp";
		String auction_id_string = request.getParameter("auction_id_2");
		String bid_string = request.getParameter("bid_price");
		String autobid_limit = request.getParameter("autobid_limit");
		String username = (String) session.getAttribute("userid");
		String previous_highest_bidder = "";
		String current_highest_bidder = "";
		int auto_bid;
		double autobid_limit_price = 0;
		double previous_highest_bid = 0;
		double buy_price = 0;

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/proj2016?autoReconnect=true&useSSL=false", "root", "ThereDKLD82");

		Statement st = con.createStatement();
		ResultSet rs, rs1;

		if (request.getParameter("autobid") != null && request.getParameter("autobid").equals("Yes")) {
			auto_bid = 1;
			autobid_limit_price = Double.parseDouble(autobid_limit);
		} else {
			autobid_limit_price = 0;
			auto_bid = 0;
		}
		if (auction_id_string.compareTo("Enter Auction ID") == 0) {
			response.sendRedirect(error_page);
		} else {
			//case that user chooses to place a bid
			int auction_id = 0;
			double bid_price = 0;

			if (auction_id_string.compareTo("Enter Auction ID") == 0) {
				response.sendRedirect(error_page);
			}

			rs = st.executeQuery("SELECT auction.current_highest_bid FROM auction WHERE auction.auction_id = '"+auction_id+"'");

			while (rs.next()) {
				previous_highest_bid = rs.getDouble(1);
			}
			
			if (bid_string.compareTo("Enter Bid Price") == 0) {
				//case that only the bid button is pressed
				bid_price = previous_highest_bid + 1;
			} else {
				bid_price = Double.parseDouble(bid_string);
			}

			auction_id = Integer.parseInt(auction_id_string);

			rs = st.executeQuery(
					"SELECT bid.username FROM bid, bid_history WHERE bid_history.auction_id = '" + auction_id
							+ "' AND bid.bid_id = bid_history.bid_id AND bid.offer = (SELECT max(bid.offer) FROM bid, bid_history WHERE bid_history.auction_id = '"
							+ auction_id + "' AND bid_history.bid_id = bid.bid_id)");

			while (rs.next()) {
				previous_highest_bidder = rs.getString("username");
			}

			rs = st.executeQuery("SELECT auction.current_highest_bid FROM auction WHERE auction.auction_id = '"+auction_id+"'");
			while (rs.next()) {
				previous_highest_bid = rs.getDouble(1);
			}
			
			rs = st.executeQuery("SELECT auction.auto_sale_price FROM auction WHERE auction.auction_id = '"+auction_id+"'");
			
			while (rs.next()) {
				buy_price = rs.getDouble(1);
			}
			
			if (bid_price < previous_highest_bid) {
				response.sendRedirect(error_page);
			} else if (bid_price == buy_price){
				//case that bid price is equal to the auto sale price so item is automatically bought
				int i = st.executeUpdate(
						"DELETE FROM item WHERE auction.item_id = item.item _id AND auction.auction_id = '"
								+ auction_id + "'");
				int j = st.executeUpdate("DELETE FROM auction WHERE auction.auction_id = '" + auction_id + "'");

				response.sendRedirect("buy_now_page.jsp");
			} else {

				int i = st.executeUpdate("UPDATE auction SET auction.current_highest_bid = '" + bid_price
						+ "' WHERE auction.auction_id = '" + auction_id + "'");
				int j = st.executeUpdate(
						"INSERT INTO bid(bid_id,time_placed,offer,autobid,autobid_limit,username) VALUES(NULL,CURTIME(), '"
								+ bid_price + "', '" + auto_bid + "', '" + autobid_limit_price + "', '"
								+ username + "')");

				int k = st.executeUpdate("INSERT INTO bid_history(bid_id,auction_id) VALUES(LAST_INSERT_ID(),'"
						+ auction_id + "')");
				
				rs = st.executeQuery(
						"SELECT bid.username FROM bid, bid_history WHERE bid_history.auction_id = '" + auction_id
								+ "' AND bid.bid_id = bid_history.bid_id AND bid.offer = (SELECT max(bid.offer) FROM bid, bid_history WHERE bid_history.auction_id = '"
								+ auction_id + "' AND bid_history.bid_id = bid.bid_id)");

				while (rs.next()) {
					current_highest_bidder = rs.getString("username");
				}
				
				System.out.println(current_highest_bidder);
				
				int l = st.executeUpdate("UPDATE auction SET auction.bidder_id = '" + current_highest_bidder
						+ "' WHERE auction.auction_id = '" + auction_id + "'");
				
				if(current_highest_bidder.compareTo(previous_highest_bidder) != 0) {
					String msg = "Dear " + previous_highest_bidder + ", We are notifying you that you have been outbid for item auction id number " + auction_id;
					int m = st.executeUpdate("INSERT INTO messages(message_id,src,dest,msg_text) VALUES(NULL,'System','"+previous_highest_bidder+"','"+msg+"')");
				}
				
				response.sendRedirect("bid_page.jsp");
			}
		}
	} else if (request.getParameter("Buy Now") != null) {
		//case that user chooses to buy game now
		String error_page = "search_buy_bid_error.jsp";
		String auction_id_string = request.getParameter("auction_id_1");
		int auction_id = 0;
		String username = (String) session.getAttribute("userid");

		if (auction_id_string.compareTo("Enter Auction ID") == 0) {
			response.sendRedirect(error_page);
		} else {

			auction_id = Integer.parseInt(auction_id_string);

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/proj2016?autoReconnect=true&useSSL=false", "root",
					"ThereDKLD82");

			Statement st = con.createStatement();
			ResultSet rs;

			int i = st.executeUpdate(
					"DELETE FROM item WHERE auction.item_id = item.item _id AND auction.auction_id = '"
							+ auction_id + "'");
			int j = st.executeUpdate("DELETE FROM auction WHERE auction.auction_id = '" + auction_id + "'");

			response.sendRedirect("buy_now_page.jsp");
		}
	}
%>