<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="SpringDB.DBconnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring-MVC</title>
</head>
<body>
       <%@include file="adminHeader.jsp"%><br>
       <h2 style="text-align: center;">All Employee</h2>
       <%
          String uname = (String)session.getAttribute("uname");
          if(uname == null)
          {
        	response.sendRedirect("login");  
          }
          
          try
          {
        	Statement st = DBconnector.getStatement();
        	String q = "SELECT * FROM emp";
        	
        	ResultSet rs = st.executeQuery(q);
        	while(rs.next())
        	{
       %>
           <form action="#" style="text-align: center">
           <hr>
             Emp-name &nbsp;:&nbsp;<input type="text" name="uname" value="<%=rs.getString("emp_name")%>" required="required"><br><br>
             
             Emp-Mailid &nbsp;:&nbsp;<input type="text" name="mailid" value="<%=rs.getString("emp_mailid")%>" required="required"><br><br>
             
             Emp-Contact &nbsp;:&nbsp;<input type="text" name="contact" value="<%=rs.getString("emp_contact")%>" required="required"><br><br>           
      </form>
       <% 	  	
        	}
          }
          catch(SQLException e)
          {
        	 System.out.println(e); 
          }
       %>
       <hr>
</body>
</html>