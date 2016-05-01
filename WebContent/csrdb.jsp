<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import ="java.sql.*" %>
<% 
			String qid=request.getParameter("q_id");
			String msg = request.getParameter("Text1");
			String update_request = "DELETE FROM demo_bids WHERE bid_id="+qid+"";
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
		            "root", "ThereDKLD82");
			Statement st2 = con2.createStatement();
			
			int i = st2.executeUpdate(update_request);
			
			if (i > 0) {
		        
		        response.sendRedirect("csr_acc_del_success.jsp");
		      
		    } else {
		        response.sendRedirect("customer_service_rep.jsp");
		    }
			%>