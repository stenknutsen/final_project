<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--Code Contributors: Karl Capili --%>
<%@ page import="java.sql.*"%>

<%
	String game = request.getParameter("game");
	String genre = request.getParameter("genre");
	String rate = request.getParameter("rating");
	String min_p = request.getParameter("min_price");
	String max_p = request.getParameter("max_price");
	String system = request.getParameter("system");
	String condition = request.getParameter("condition");
	
	int rating = 0;
	double min_price = 0;
	double max_price = 0; 
	
	if (rate.compareTo("") != 0) {
		rating = Integer.parseInt(rate);
	}
	
	if (min_p.compareTo("Minimum Price") != 0) {
		min_price = Double.valueOf(min_p);
	}
	if (max_p.compareTo("Maximum Price") != 0) {
		max_price = Double.valueOf(max_p);
	}

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/proj2016?autoReconnect=true&useSSL=false", "root", "ThereDKLD82");

	Statement st = con.createStatement();
	ResultSet rs;

	if (system == null || condition == null) {
		//Error Case
		response.sendRedirect("search_results_error.jsp");
	} else {

		if (game.compareTo("") == 0 && genre.compareTo("") == 0 && rating== 0 && min_price == 0
				&& max_price == 0) {
			//case that only system and condition are inputted
			rs = st.executeQuery("SELECT * FROM game, item WHERE game.system = '" + system
					+ "' AND item.item_condition = '" + condition + "' AND game.upc_code = item.upc_code");

			if (rs.next()) {
				request.getSession().setAttribute("system", system);
				request.getSession().setAttribute("condition", condition);
				response.sendRedirect("search_results_none.jsp");
			}
			
		} else if (rating == 0 && min_price == 0 && max_price == 0 && genre.compareTo("") == 0 ) {
			//case that only title is also inputted
			rs = st.executeQuery("SELECT * FROM game, item WHERE game.title = '" + game
					+ "' AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game.jsp");
			}

		} else if (game.compareTo("") == 0 && rating == 0 && min_price == 0 && max_price == 0) {
			//case that only genre is also inputted
			rs = st.executeQuery("SELECT * FROM game, item WHERE game.genre = '" + genre
					+ "' AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code");
			
			if (rs.next()) {
				session.setAttribute("genre", genre);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_genre.jsp");
			}

		} else if (game.compareTo("") == 0 && genre.compareTo("") == 0 && min_price == 0 && max_price == 0) {
			//case that only rating is also inputted
			rs = st.executeQuery("SELECT * FROM game, item WHERE game.rating >= '" + rating
					+ "' AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code");
			
			if (rs.next()) {
				session.setAttribute("rating", rating);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_rating.jsp");
			}

		} else if (game.compareTo("") == 0 && genre.compareTo("") == 0 && rating == 0 && max_price == 0) {
			//case that only min_price is inputted
			rs = st.executeQuery(
					"SELECT * FROM game, item, auction WHERE (auction.auto_sale_price BETWEEN '" + min_price
							+ "' AND 100000000000 OR auction.current_highest_bid BETWEEN '" + min_price
							+ "' AND 100000000000) AND game.system = '" + system
							+ "' AND item.item_condition = '" + condition
							+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");

			if (rs.next()) {
				session.setAttribute("min_price", min_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_min_price.jsp");
			}
			
		} else if (game.compareTo("") == 0 && genre.compareTo("") == 0 && rating == 0 && min_price == 0) {
			//case that only max price is inputted 
			rs = st.executeQuery(
					"SELECT * FROM game, item, auction WHERE (auction.auto_sale_price BETWEEN 0 AND '"
							+ max_price + "' OR auction.current_highest_bid BETWEEN 0 AND '" + max_price
							+ "')  AND game.system = '" + system + "' AND item.item_condition = '" + condition
							+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");

			if (rs.next()) {
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_max_price.jsp");
			}
			
		} else if (rating == 0 && min_price == 0 && max_price == 0) {
			//case that game and genre are inputted 
			rs = st.executeQuery("SELECT * FROM game, item WHERE game.title = '" + game + "' AND game.genre = '"
					+ genre + "' AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("genre", genre);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_genre.jsp");
			}

		} else if (game.compareTo("") == 0 && genre.compareTo("") == 0 && rating == 0) {
			//case that min_price and max_price are inputted
			rs = st.executeQuery("SELECT * FROM auction, item, game  WHERE auction.auto_sale_price BETWEEN '"
					+ min_price + "' AND '" + max_price + "'  OR auction.current_highest_bid BETWEEN '"
					+ min_price + "' AND '" + max_price + "' AND game.system = '" + system
					+ "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");

			if (rs.next()) {
				session.setAttribute("min_price", min_price);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_min_max.jsp");
			}
			
		} else if (genre.compareTo("") == 0 && min_price == 0 && max_price == 0) {
			//case that title and rating are inputted
			rs = st.executeQuery("SELECT * FROM game, item WHERE game.title = '" + game
					+ "' AND game.rating >= '" + rating + "' AND game.system = '" + system
					+ "' AND item.item_condition = '" + condition + "' AND game.upc_code = item.upc_code");

			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("rating", rating);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_rating.jsp");
			}
			
		} else if (genre.compareTo("") == 0 && rating == 0 && max_price == 0) {
			//case that title and min price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.title = '" + game
					+ "' AND (auction.auto_sale_price BETWEEN '" + min_price
					+ "' AND 100000000000 OR auction.current_highest_bid BETWEEN '" + min_price
					+ "' AND 100000000000) AND game.system = '" + system + "' AND item.item_condition = '"
					+ condition + "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("min_price", min_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_min.jsp");
			}

		} else if (genre.compareTo("") == 0 && rating == 0 && min_price == 0) {
			//case that title and max price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.title = '" + game
					+ "' AND (auction.auto_sale_price BETWEEN 0 AND '" + max_price
					+ "' OR auction.current_highest_bid BETWEEN 0 AND '" + max_price + "')  AND game.system = '"
					+ system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_max.jsp");
			}

		} else if (game.compareTo("") == 0 && min_price == 0 && max_price == 0) {
			//case that genre and rating are inputted
			rs = st.executeQuery("SELECT * FROM game, item WHERE game.genre = '" + genre
					+ "' AND game.rating = '" + rating + "' AND game.system = '" + system
					+ "' AND item.item_condition = '" + condition + "' AND game.upc_code = item.upc_code");
			
			if (rs.next()) {
				session.setAttribute("genre", genre);
				session.setAttribute("rating", rating);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_genre_rating.jsp");
			}

		} else if (game.compareTo("") == 0 && rating == 0 && max_price == 0) {
			//case that genre and min_price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.genre = '" + genre
					+ "'(AND auction.auto_sale_price BETWEEN '" + min_price
					+ "' AND 100000000000 OR auction.current_highest_bid BETWEEN '" + min_price
					+ "' AND 100000000000) AND game.system = '" + system + "' AND item.item_condition = '"
					+ condition + "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("genre", genre);
				session.setAttribute("min_price", min_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_genre_min.jsp");
			}

		} else if (game.compareTo("") == 0 && rating == 0 && min_price == 0) {
			//case that genre and max_price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.genre = '" + genre
					+ "' AND (auction.auto_sale_price BETWEEN 0 AND '" + max_price
					+ "' OR auction.current_highest_bid BETWEEN 0 AND '" + max_price + "') AND game.system = '"
					+ system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("genre", genre);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_genre_max.jsp");
			}

		} else if (game.compareTo("") == 0 && genre.compareTo("") == 0 && max_price == 0) {
			//case that rating and min_price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.rating = '" + rating
					+ "' AND (auction.auto_sale_price BETWEEN '" + min_price
					+ "' AND 100000000000 OR auction.current_highest_bid BETWEEN '" + min_price
					+ "' AND 100000000000) AND game.system = '" + system + "' AND item.item_condition = '"
					+ condition + "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("rating", rating);
				session.setAttribute("min_price", min_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_rating_min.jsp");
			}

		} else if (game.compareTo("") == 0 && genre.compareTo("") == 0 && min_price == 0) {
			//case that rating and max_price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.rating = '" + rating
					+ "' AND (auction.auto_sale_price BETWEEN 0 AND '" + max_price
					+ "' OR auction.current_highest_bid BETWEEN 0 AND '" + max_price + "') AND game.system = '"
					+ system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("rating", rating);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_rating_max.jsp");
			}

		} else if (min_price == 0 && max_price == 0) {
			//case that title, genre and rating are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.title = '" + game + "' AND game.genre = '"
					+ genre + "' AND game.rating = '" + rating + "' AND game.system = '" + system
					+ "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("genre", genre);
				session.setAttribute("rating", rating);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_genre_rating.jsp");
			}

		} else if (rating == 0 && max_price == 0) {
			//case that title, genre and min_price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.title = '" + game
					+ "' AND game.genre = '" + genre + "' AND (auction.auto_sale_price BETWEEN '" + min_price
					+ "' AND 100000000000 OR auction.current_highest_bid BETWEEN '" + min_price
					+ "' AND 100000000000) AND game.system = '" + system + "' AND item.item_condition = '"
					+ condition + "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("genre", genre);
				session.setAttribute("min_price", min_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_genre_min.jsp");
			}

		} else if (rating == 0 && min_price == 0) {
			//case that title, genre and max_price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.title = '" + game
					+ "' AND game.genre = '" + genre + "' AND (auction.auto_sale_price BETWEEN 0 AND '"
					+ max_price + "' OR auction.current_highest_bid BETWEEN 0 AND '" + max_price
					+ "') AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("genre", genre);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_genre_max.jsp");
			}

		} else if (genre.compareTo("") == 0 && max_price == 0) {
			//case that title, rating and min_price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE  game.title = '" + game
					+ "' AND game.rating = '" + rating + "' AND (auction.auto_sale_price BETWEEN '" + min_price
					+ "' AND 100000000000 OR auction.current_highest_bid BETWEEN '" + min_price
					+ "' AND 100000000000) AND game.system = '" + system + "' AND item.item_condition = '"
					+ condition + "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("rating", rating);
				session.setAttribute("min_price", min_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_rating_min.jsp");
			}

		} else if (genre.compareTo("") == 0 && min_price == 0) {
			//case that title, rating and max_price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.title = '" + game
					+ "' AND game.rating = '" + rating + "' AND (auction.auto_sale_price BETWEEN 0 AND '"
					+ max_price + "' OR auction.current_highest_bid BETWEEN 0 AND '" + max_price
					+ "') AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("rating", rating);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_rating_max.jsp");
			}

		} else if (genre.compareTo("") == 0 && rating == 0) {
			//case that title, min_price and max_price are inputted
			rs = st.executeQuery("SELECT * FROM auction, item, game  WHERE game.title = '" + game
					+ "' AND auction.auto_sale_price BETWEEN '" + min_price + "' AND '" + max_price
					+ "'  OR auction.current_highest_bid BETWEEN '" + min_price + "' AND '" + max_price
					+ "' AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("min_price", min_price);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_min_max.jsp");
			}

		} else if (game.compareTo("") == 0 && max_price == 0) {
			//case that genre, rating and min_price are inputted
			rs = st.executeQuery("SELECT * FROM auction, item, game WHERE game.genre = '" + genre
					+ "' AND game.rating = '" + rating + "' AND (auction.auto_sale_price BETWEEN '" + min_price
					+ "' AND 100000000000 OR auction.current_highest_bid BETWEEN '" + min_price
					+ "' AND 100000000000) AND game.system = '" + system + "' AND item.item_condition = '"
					+ condition + "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("genre", genre);
				session.setAttribute("rating", rating);
				session.setAttribute("min_price", min_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_genre_rating_min.jsp");
			}

		} else if (game.compareTo("") == 0 && min_price == 0) {
			//case that genre, rating and max_price are inputted
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.genre = '" + genre
					+ "' AND game.rating = '" + rating + "' AND (auction.auto_sale_price BETWEEN 0 AND '"
					+ max_price + "' OR auction.current_highest_bid BETWEEN 0 AND '" + max_price
					+ "') AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("genre", genre);
				session.setAttribute("rating", rating);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_genre_rating_max.jsp");
			}

		}  else if (game.compareTo("") == 0 && rating == 0) {
			//case that genre, min_price and max_price are inputted
			rs = st.executeQuery("SELECT * FROM auction, item, game  WHERE game.genre = '" + genre
					+ "' AND auction.auto_sale_price BETWEEN '" + min_price + "' AND '" + max_price
					+ "'  OR auction.current_highest_bid BETWEEN '" + min_price + "' AND '" + max_price
					+ "' AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("genre", genre);
				session.setAttribute("min_price", min_price);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_genre_min_max.jsp");
			}

		} else if (game.compareTo("") == 0 && genre.compareTo("") == 0) {
			//case that rating, min_price and max_price are inputted
			rs = st.executeQuery("SELECT * FROM auction, item, game  WHERE game.rating = '" + rating
					+ "' AND auction.auto_sale_price BETWEEN '" + min_price + "' AND '" + max_price
					+ "'  OR auction.current_highest_bid BETWEEN '" + min_price + "' AND '" + max_price
					+ "' AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("rating", rating);
				session.setAttribute("min_price", min_price);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_rating_min_max.jsp");
			}

		} else if (max_price == 0) {
			//case that title, genre, rating and min_price are inputted
			rs = st.executeQuery("SELECT * FROM auction, item, game WHERE game.title = '" + game
					+ "' AND game.genre = '" + genre + "' AND game.rating = '" + rating
					+ "' AND (auction.auto_sale_price BETWEEN '" + min_price
					+ "' AND 100000000000 OR auction.current_highest_bid BETWEEN '" + min_price
					+ "' AND 100000000000) AND game.system = '" + system + "' AND item.item_condition = '"
					+ condition + "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("genre", genre);
				session.setAttribute("rating", rating);
				session.setAttribute("min_price", min_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_genre_rating_min.jsp");
			}
			

		} else if (min_price == 0) {
			//case that title, genre, rating and max_price are inputted 
			rs = st.executeQuery("SELECT * FROM game, item, auction WHERE game.title = '" + game
					+ "' AND game.genre = '" + genre + "' AND game.rating = '" + rating
					+ "' AND (auction.auto_sale_price BETWEEN 0 AND '" + max_price
					+ "' OR auction.current_highest_bid BETWEEN 0 AND '" + max_price + "') AND game.system = '"
					+ system + "' AND item.item_condition = '" + condition
					+ "' AND game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("genre", genre);
				session.setAttribute("rating", rating);
				session.setAttribute("max_price", min_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_genre_rating_max.jsp");
			}

		} else if (genre.compareTo("") == 0) {
			//case that title, rating, min_price and max_price are inputted
			rs = st.executeQuery("SELECT * FROM auction, item, game  WHERE game.title = '" + game
					+ "' AND game.rating = '" + rating + "' AND auction.auto_sale_price BETWEEN '" + min_price
					+ "' AND '" + max_price + "'  OR auction.current_highest_bid BETWEEN '" + min_price
					+ "' AND '" + max_price + "' AND game.system = '" + system + "' AND item.item_condition = '"
					+ condition + "' game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("rating", rating);
				session.setAttribute("min_price", min_price);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_game_rating_min_max.jsp");
			}

		} else if (game.compareTo("") == 0) {
			//case that genre, rating, min_price and max_price are inputted
			rs = st.executeQuery("SELECT * FROM auction, item, game  WHERE game.genre = '" + genre
					+ "' AND game.rating = '" + rating + "' AND auction.auto_sale_price BETWEEN '" + min_price
					+ "' AND '" + max_price + "'  OR auction.current_highest_bid BETWEEN '" + min_price
					+ "' AND '" + max_price + "' AND game.system = '" + system + "' AND item.item_condition = '"
					+ condition + "' game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("genre", genre);
				session.setAttribute("rating", rating);
				session.setAttribute("min_price", min_price);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_genre_rating_min_max.jsp");
			}

		} else {
			//case that everything is inputted 
			rs = st.executeQuery("SELECT * FROM auction, item, game  WHERE game.title = '" + game
					+ "' AND game.genre = '" + genre + "' AND game.rating = '" + rating
					+ "' AND auction.auto_sale_price BETWEEN '" + min_price + "' AND '" + max_price
					+ "'  OR auction.current_highest_bid BETWEEN '" + min_price + "' AND '" + max_price
					+ "' AND game.system = '" + system + "' AND item.item_condition = '" + condition
					+ "' game.upc_code = item.upc_code AND item.item_id = auction.item_id");
			
			if (rs.next()) {
				session.setAttribute("game", game);
				session.setAttribute("genre", genre);
				session.setAttribute("rating", rating);
				session.setAttribute("min_price", min_price);
				session.setAttribute("max_price", max_price);
				session.setAttribute("system", system);
				session.setAttribute("condition", condition);
				response.sendRedirect("search_results_everything.jsp");
			}
		}
	}
%>