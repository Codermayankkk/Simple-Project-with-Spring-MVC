<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring-MVC</title>
<style>
ul 
{
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li 
{
	float: left;
}

li a 
{
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not(.active) 
{
	background-color: #111;
}

.active 
{
	background-color: #04AA6D;
}
</style>
</head>
<body>

	<ul>
		<li><a class="active" href="adminHome">Home</a></li>
		<li><a href="details">Employee details</a></li>
		<li><a href="update">Update Information</a></li>
		<li><a href="delete">Delete Account</a></li>
		<li><a href="logout">Logout</a></li>
	</ul>

</body>
</html>