<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring-MVC</title>
</head>
<body>
       <h1 style="text-align: center">Register Here</h1>
       <%
          String msg = (String)request.getAttribute("msg");
          String nomsg = (String)request.getAttribute("nomsg");
          if(msg != null)
          {
        	 out.println("<h2 style='color:green'>"+msg+"</h2>"); 
          }
          if(nomsg != null)
          {
        	  out.println("<h2 style='color:red'>"+nomsg+"</h2>"); 
          }
       %>
       <form action="Registration" style="text-align: center">
             Emp-name &nbsp;:&nbsp;<input type="text" name="uname" placeholder="Enter your username" required="required"><br><br>
             
             New-Password &nbsp;:&nbsp;<input type="password" name="npass" placeholder="Enter your new password" required="required"><br><br>
             Confirm-Password<input type="password" name="upass" placeholder="Enter your confirm password" required="required"><br><br>
             
             Emp-Mailid &nbsp;:&nbsp;<input type="text" name="mailid" placeholder="Enter your mailid" required="required"><br><br>
             Emp-Contact &nbsp;:&nbsp;<input type="text" name="contact" placeholder="Enter your contact" required="required"><br><br>
             <input type="submit" value="register">
      </form>
      <a href="login" style="text-align: center">Sign In</a>
</body>
</html>