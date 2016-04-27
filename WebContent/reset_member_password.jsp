<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Member Password</title>
</head>
<body>
<form method="post" action="reset_mem_pwd.jsp">
<table border="1" width="30%" cellpadding="5">
              <thead>
                  <tr>
                  <th colspan="2">Reset Member Password</th>
                  </tr>
                </thead>
                <tbody>
               
                  <tr>
                  <td>Username</td>
                  <td><input type="text" name="uname" value="" /></td>
                  </tr>
                   
                    <tr>
                      <td>New Password</td>
                      <td><input type="text" name="pass" value="" /></td>
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