<%@page import="java.sql.ResultSet"%>
<%@page import="SpringDB.DBconnector"%>
<%@page import="java.sql.Statement"%>
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
       <%@include file="adminHeader.jsp"%><br>
       <%
          String uname = (String)session.getAttribute("uname");
          String nmsg = (String)request.getAttribute("nmsg");
          
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
        	 String q = "SELECT * FROM emp WHERE emp_name = '"+uname+"'";
        	 
        	 ResultSet rs = st.executeQuery(q);
        	 if(rs.next())
        	 {
       %>
           <form action="deleteInformation" style="text-align: center">
             Emp-name &nbsp;:&nbsp;<input type="text" name="uname" value="<%=rs.getString("emp_name")%>" readonly><br><br>
             <input type="submit" value="delete">
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