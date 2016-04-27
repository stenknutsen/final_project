<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question and Answer Page</title>
</head>
<body>
<form method="post" action="q_n_a.jsp">
     <table border="1" width="30%" cellpadding="3">
              <thead>
                  <tr>
                      <th  colspan="2">Send Questions to a CSR</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                      <td>Choose Question Subject:</td>
                      <td><select name="sel">
							<option value="purchases">Purchases</option>
							<option value="returns">Returns</option>
							<option value="payment">Payment</option>
							<option value="account">Account</option>
						</select>
						<br>
					 </td>
                  </tr>
                  <tr>
                      <td>Question:</td>
                      <td><textarea name="Text1" cols="40" rows="5"></textarea></td>
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