<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Code Contributors: Sten Knutsen --%>
<%@ page import ="java.sql.*" %>
<% 
			String qid=request.getParameter("q_id");
			String msg = request.getParameter("Text1");
			String update_request = "UPDATE questions SET a_text='" + msg + "' WHERE question_id="+qid+"";
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj2016",
		            "root", "ThereDKLD82");
			Statement st2 = con2.createStatement();
			
			int i = st2.executeUpdate(update_request);
			if (i > 0) {
		        
		        response.sendRedirect("csr_answer_success.jsp");
		      
		    } else {
		        response.sendRedirect("customer_service_rep.jsp");
		    }
			%>