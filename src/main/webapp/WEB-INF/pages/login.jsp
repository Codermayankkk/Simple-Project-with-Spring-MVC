<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring-MVC</title>
</head>
<body>
      <h1 style="text-align: center">Login Here</h1>
      
      <%
         String msg = (String)request.getAttribute("msg");
         String dmsg = (String)request.getAttribute("dmsg");
         
         if(dmsg != null)
         {
        	 out.println("<h3 style='color = blue'>"+dmsg+"</h3>"); 
         }
         if(msg != null)
         {
        	out.println("<h3 style='color = red'>"+msg+"</h3>"); 
         }
      %>
      
      <form action="checkLogin" style="text-align: center">
             <input type="text" name="uname" placeholder="Enter your username" required="required">
             <input type="password" name="upass" placeholder="Enter your password" required="required">
             <input type="submit" value="login">
      </form>
      
      <a href="register" style="text-align: center">Sign Up</a>
</body>
</html>