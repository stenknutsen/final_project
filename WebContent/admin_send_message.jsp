<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
</head>
<body>
<form method="post" action="admin_send_msg.jsp">
     <table border="1" width="30%" cellpadding="3">
              <thead>
                  <tr>
                      <th  colspan="2">Send Message</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                      <td>To (Username):</td>
                      <td><input type="text" name="uname" value="" /></td>
                  </tr>
                  <tr>
                      <td>Message:</td>
                      <td><textarea name="Text1" cols="40" rows="5"></textarea></td>
                  </tr>
                  <tr>
                      <td><input type="submit" value="Send" /></td>
                      <td><input type="reset" value="Reset" /></td>
                  </tr>
                    
              </tbody>
          </table>
</form>
</body>
</html>