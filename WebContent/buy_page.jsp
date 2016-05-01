<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--Code Contributors: Karl Capili --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy Page</title>
</head>
<body>
	<h1>Buy Items</h1>
	
	<form method="post" action="buy_item.jsp">
		<div class="container">
			<input type="text" name="game" value="" /> Enter Game <br />
			<h2>Please Check For Console</h2>
				<input type="radio" name="system" value="Xbox" /> Xbox <br />
				<input type="radio" name="system" value="Playstation" /> Playstation <br />
				<input type="radio" name="system" value="PC" /> PC <br />
				<input type="radio" name="system" value="Wii" /> Wii <br />

			<div>
				<input type="submit" value="Submit" name="Buy" />
				<input type="reset" value="Clear" />
			</div>
		</div>
	</form>
	
</body>
</html>