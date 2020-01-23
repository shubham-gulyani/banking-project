<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>transaction</title>
</head>
<body bgcolor="orange">
<%
String t=request.getParameter("trns");
if(t.equals("credit"))
	response.sendRedirect("http://banking3.mybluemix.net/credit2.html");
if(t.equals("debit"))
	response.sendRedirect("http://banking3.mybluemix.net/debit2.html");
%>

</body>
</html>