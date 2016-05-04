<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
		<%--Code Contributors: Ben Homa --%>
	<%@ page import="java.sql.*"%>
	<%

		String username = (String)session.getAttribute("userid");
		String upc_code = request.getParameter("UPC");
		String bidprice = request.getParameter("Bid Price");
		String sellprice = request.getParameter("Selling");
		String condition = request.getParameter("Condition");

		String title = request.getParameter("Title");
		String genre = request.getParameter("Genre");
		String rating = request.getParameter("Rating");
		String system = request.getParameter("Xbox");
		String year = request.getParameter("Year");
		String month = request.getParameter("Month");
		String day = request.getParameter("Day");
		String hour = request.getParameter("Hour");
		String minute = request.getParameter("Minute");
		Long upc = Long.valueOf(upc_code).longValue();
		String member_id = "hello";

		Integer bid = Integer.parseInt(bidprice);


		String test = year+month+day+" "+hour+minute;

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
			int k = st.executeUpdate("insert into game(upc_code, title, system, rating, genre, units_sold) values('" + upc + "','" + title + "','" + system + "','" + rating + "','" + genre + "','" + '0' + "')");
			int x = st.executeUpdate("insert into item(item_id, min_price, item_condition, upc_code) values('" + item + "','" + bid + "','" + condition + "','" + upc + "')");

			int y = st.executeUpdate("insert into auction(auction_id, auto_sale_price, current_highest_bid, item_id, seller_id) values ('" + aid + "','" + sellprice + "','" + bid + "','" + item + "','" + member_id + "')");
			int z = st.executeUpdate("Update auction SET hours_open = STR_TO_DATE('" + test +"', '%Y%m%d %k%i') where auction_id ='"+ aid + "'");
			if (i > 0 && x > 0 && y > 0) {

				response.sendRedirect("postSellWin.jsp");

			} else {
				response.sendRedirect("PostSellFail.jsp");
			}
	%>
