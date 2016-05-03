<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%--Code Contributors: Ben Homa --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="member_update_details.jsp">
<table border="1" width="30%" cellpadding="5">
              <thead>
                  <tr>
                  <th colspan="2">Update Information Here</th>
                  </tr>
                </thead>
                <tbody>
                <tr>
                 <td>Credit Card</td>
                 <td><input type="text" name="Credit" value="" /></td>
                </tr>
                  <tr>
                  <td>Address</td>
                  <td><input type="text" name="Street" value="" /></td>
                  </tr>
                  <tr>
                    <td>City</td>
                    <td><input type="text" name="City" value="" /></td>
                    </tr>

                    <tr>
                      <td>Zip</td>
                      <td><input type="password" name="Zip" value="" /></td>
                    </tr>
                    <tr>
                      <td><input type="submit" value="Submit" /></td>
                      <td><input type="reset" value="Reset" /></td>
                    </tr>
               </tbody>
          </table>
</form>
</body>
</html>
