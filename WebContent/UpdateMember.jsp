<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--Code Contributors: Ben Homa --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Page</title>
</head>
<body>
<form method="post" action="member_update.jsp">
<table border="1" width="30%" cellpadding="5">
              <thead>
                  <tr>
                  <th colspan="2">Update Information Here</th>
                  </tr>
                </thead>
                <tbody>
                <tr>
                 <td>First Name</td>
                 <td><input type="text" name="fname" value="" /></td>
                </tr>
                  <tr>
                  <td>Last Name</td>
                  <td><input type="text" name="lname" value="" /></td>
                  </tr>
                  <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value="" /></td>
                    </tr>

                    <tr>
                      <td>Password</td>
                      <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                      <td><input type="submit" value="Submit" /></td>
                      <td><input type="reset" value="Reset" /></td>
                    </tr>
                 <!--   <tr>
                      <td colspan="2">Already registered: <a href="index.jsp">Login Here</a></td>
                  </tr> -->
              </tbody>
          </table>
</form>
</body>
</html>
