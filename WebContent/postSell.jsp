<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--Code Contributors: Ben Homa --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sell Page</title>
</head>
<body>
	<h1>Welcome</h1>

	<form method="post" action="sellItem.jsp">
		<div class="container">
			<input type="text" name="Game" /> Enter Game <br />
			<input type="text" name="Genre" /> Enter Genre <br />
			<input type="text" name="Bid Price" /> Enter Bidding Price To Start<br />
			<input type="text" name="Selling Price" /> Enter Selling Price <br />
			<h2>Please Check For Console</h2>
			<input type="radio" name="Xbox" /> Xbox <br />
			<input type="radio" name="Xbox" /> Playstation <br />
			<input type="radio" name="Xbox" /> PC <br />
			<input type="radio" name="Xbox" /> Wii <br />

			<input type="text" name="date" value="Put End Date Here"/>
			<input type="text" name="hour" value="Put End Hour Here"/>
			<div>
			<input type="submit" value="Submit" name="Sell" />
			<input type="reset" value="Clear" />
			</div>
		</div>
	</form>
</body>
</html>
