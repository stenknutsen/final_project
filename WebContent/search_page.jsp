<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%--Code Contributors: Karl Capili --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Page</title>
</head>
<body>
	<h1>Search Items</h1>

	<form method="post" action="search_item.jsp">
		<div class="container">
			<input type="text" name="game" /> Enter Game <br />
			<input type="text" name="rating" /> Enter Rating <br />
			<input type="text" name="genre" /> Enter Genre <br />
			<input type="text" name="min_price" value="Minimum Price"/>
			<input type="text" name="max_price" value="Maximum Price"/>
			<h2>Please Check For System</h2>
				<input type="radio" name="system" value="Xbox"/> Xbox <br />
				<input type="radio" name="system" value="Playstation"/> Playstation <br />
				<input type="radio" name="system" value="PC"/> PC <br />
				<input type="radio" name="system" value="Wii"/> Wii <br />
			<h3>Please Check For Condition</h3>
				<input type="radio" name="condition" value="New"/> Brand New <br />
				<input type="radio" name="condition" value="Refurbished"/> Refurbished <br />
				<input type="radio" name="condition" value="Used"/> Used <br />			
			<div>
				<input type="submit" value="Submit" name="Sell" />
				<input type="reset" value="Clear" />
			</div>
		</div>
	</form>

</body>
</html>