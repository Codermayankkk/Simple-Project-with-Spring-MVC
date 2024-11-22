<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring-MVC</title>
</head>
<body>
<%@include file="adminHeader.jsp"%>
       <%
          String msg = (String)request.getAttribute("msg");
          String uname = (String)session.getAttribute("uname");

          if(uname == null)
          { 
        	 response.sendRedirect("login"); 
          }
          if(msg != null)
          { 
        	 out.println("<h2 style='color:blue;text-align:center;'>"+msg+"</h2>"); 
          }
       %>
</body>
</html>