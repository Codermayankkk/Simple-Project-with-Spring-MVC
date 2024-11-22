<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="SpringDB.DBconnector"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring-MVC</title>
</head>
<body>
<%@include file="adminHeader.jsp" %>
       <h1 style="text-align: center">Update Here</h1>
       <%
          String uname = (String)session.getAttribute("uname");
          String msg = (String)request.getAttribute("msg");
          String nmsg = (String)request.getAttribute("nmsg");
          
          if(msg != null)
          {
        	  out.println("<h2 style='color:green;'>"+msg+"</h2>"); 
          }
          if(nmsg != null)
          {
        	  out.println("<h2 style='color:red;'>"+nmsg+"</h2>");  
          }
          
          if(uname == null)
          { 
     	    response.sendRedirect("login"); 
          }
          try
          {
        	 Statement st = DBconnector.getStatement();
        	 String q = "SELECT emp_name,emp_mailid,emp_contact FROM emp WHERE emp_name = '"+uname+"'";
        	 
        	 ResultSet rs = st.executeQuery(q);
        	 if(rs.next())
        	 {
       %> 
         <form action="updateInformation" style="text-align: center">
             Emp-name &nbsp;:&nbsp;<input type="text" name="uname" value="<%=rs.getString("emp_name")%>" required="required"><br><br>
             
             Emp-Mailid &nbsp;:&nbsp;<input type="text" name="mailid" value="<%=rs.getString("emp_mailid")%>" required="required"><br><br>
             
             Emp-Contact &nbsp;:&nbsp;<input type="text" name="contact" value="<%=rs.getString("emp_contact")%>" required="required"><br><br>
             <input type="submit" value="update">
         </form>
       <% 		 
        	 }
          }
          catch(SQLException e)
          {
        	System.out.println(e); 
          }
       %>
</body>
</html>