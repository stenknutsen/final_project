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
		String sellprice = request.getParameter("Selling");
		String system = request.getParameter("Xbox");
		String condition = request.getParameter("Condition");
		String time = request.getParameter("Date");
		String member_id = "hello";

		Integer bid = Integer.parseInt(bidprice);
		Integer timeint = Integer.parseInt(time);
		Integer item = 12, aid = 0, sold = 0;
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016", "root", "ThereDKLD82");
		Statement st = con.createStatement();

		ResultSet rs,item_id,a_id,m_id;

		item_id = st.executeQuery("select Max(item.item_id) from item");

		if(item_id.next()){
			item = item_id.getInt("Max(item.item_id)");
			item++;
		}

		a_id = st.executeQuery("select Max(auction.auction_id) from auction");

	    if(a_id.next()) {
			aid = a_id.getInt("Max(auction.auction_id)");
			aid++;
		}

	    m_id = st.executeQuery("Select member_account.member_id from member_account where member_id='"+username+"'");

	    if(m_id.next()){
	    	member_id = m_id.getString("member_account.member_id");
	    }

			int i = st.executeUpdate("update game set units_sold = units_sold +1 where upc_code='"+upc+"'");

			int x = st.executeUpdate("insert into item(item_id, min_price, item_condition, upc_code) values('" + item + "','" + bid + "','" + condition + "','" + upc + "')");

			System.out.println(sellprice);
			int y = st.executeUpdate("insert into auction(auction_id, hours_open, auto_sale_price, current_highest_bid, item_id, seller_id) values ('" + aid + "','" + timeint + "','" + sellprice + "','" + bid + "','" + item + "','" + member_id + "')");

			if (i > 0 && x > 0 && y > 0) {

				response.sendRedirect("postSellWin.jsp");

			} else {
				response.sendRedirect("PostSellFail.jsp");
			}
	%>
