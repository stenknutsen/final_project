<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String item = request.getParameter("Game");
	String genre = request.getParameter("Genre");
	String bidprice = request.getParameter("Bid Price");
	String sellprice = request.getParameter("Sell Price");
	String console = request.getParameter("Xbox");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016", "root", "ThereDKLD82");
	//VM MySQL pwd: ThereDKLD82
	Statement st = con.createStatement();

	ResultSet rs;
	rs = st.executeQuery("select game from Game where game='" + item + "'");

	if(!bidprice.equals("") && !sellprice.equals("")) {
		int i = st.executeUpdate(
				"insert into Game(game, genre, bid_price, sell_price, regdate) values ('"
						+ item + "','" + genre + "','" + bidprice + "','" + sellprice + "','" + console);
		if (i > 0) {

			response.sendRedirect("member_page.jsp");

		} else {
			response.sendRedirect("sellItem.jsp");
		}
	}
	else if(sellprice.equals("")) {
		int i = st.executeUpdate(
				"insert into Game(game, genre, bid_price, regdate) values ('"
						+ item + "','" + genre + "','" + bidprice + "','" + "','" + console);
		if (i > 0) {

			response.sendRedirect("member_page.jsp");

		} else {
			response.sendRedirect("sellItem.jsp");
		}
	}
	else {
		response.sendRedirect("sellItem.jsp");
	}


%>
