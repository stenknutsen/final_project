<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!-- Ben Homa -->
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
			<input type="text" name="UPC" /> Enter UPC of Game <br />
			<input type="text" name="Bid Price" /> Enter Bidding Price To Start<br />
			<input type="text" name="Selling" /> Enter Selling Price <br />
			<h2>Please Check For Condition</h2>
			<input type="radio" name="Condition" value="New" /> New <br />
			<input type="radio" name="Condition" value="Refurbished"/> Refurbished <br />
			<input type="radio" name="Condition" value="Used"/> Used <br />
			<input type="text"  name="Year" />Year In Number Format<br />
			<input type="text"  name="Month" />Month In Number Format (09 is September)<br />
			<input type="text"  name="Day" />Day In Number Format (05 is fifth of the month)<br />
			<input type="text"  name="Hour" />Hour In Number Format<br />
			<input type="text"  name="Minute" />Minute In Number Format<br />
			<div>
			<input type="submit" value="Submit" name="Sell" />
			<input type="reset" value="Clear" />
			</div>
		</div>
	</form>
</body>
</html>
