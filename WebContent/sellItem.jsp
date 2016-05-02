<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%--Code Contributors: Ben Homa --%>
<%@ page import="java.sql.*"%>
<%

	String upc = request.getParameter("UPC");
	String title = request.getParameter("Game");
	String genre = request.getParameter("Genre");
	String rating = request.getParameter("Rating");
	String bidprice = request.getParameter("Bid Price");
	String sellprice = request.getParameter("Sell Price");
	String system = request.getParameter("Xbox");
	String item = request.getParameter("item");
	String condition = request.getParameter("Condition");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016", "root", "root");
	//VM MySQL pwd: ThereDKLD82
	Statement st = con.createStatement();

	ResultSet rs;
	rs = st.executeQuery("select game from Game where game='" + title + "'");

	if(!bidprice.equals("") && !sellprice.equals("")) {
		int i = st.executeUpdate(
				"insert into Game(upc_code, title, system, rating, genre) values ('"
						+ upc + "','" + title + "','" + system + "','" + rating + "','" + genre);
		int x = st.executeUpdate("insert into Item(item_id, min_price, max_price, item_condition, upc_code) values ('"
				+ item + "','" + bidprice + "','" + sellprice + "','" + condition + "','" + upc);

		if (i > 0 && x > 0) {

			response.sendRedirect("postSellSucess.jsp");

		} else {
			response.sendRedirect("postSellFail.jsp");
		}
	}
		else {
		response.sendRedirect("postSellFail.jsp");
	}


%>
