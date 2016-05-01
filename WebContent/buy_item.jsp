<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%--Code Contributors: Karl Capili --%>
<%@ page import="java.sql.*"%>
<%

	String game = request.getParameter("game");
	String system = request.getParameter("system");
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016?autoReconnect=true&useSSL=false",
            "root", "ThereDKLD82");
	
	if(game.compareTo("") == 0 || system == null) {
		//Error Case
		response.sendRedirect("buy_results_error.jsp");
	}
	Statement st = con.createStatement();
	ResultSet rs;
	
	rs = st.executeQuery("Select * FROM game WHERE game.title = '"+game+"' AND game.system = '"+system+"'");
	if(rs.next()) {
		request.getSession().setAttribute("game", game);
		response.sendRedirect("buy_results.jsp");
	}
%>