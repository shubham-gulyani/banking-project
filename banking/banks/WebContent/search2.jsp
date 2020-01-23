<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>get search</title>
</head>
<body bgcolor="orange">
<%
String s=request.getParameter("srch");
if(s.equals("by name"))
	response.sendRedirect("http://banking3.mybluemix.net/sbname2.jsp");
if(s.equals("by account no."))
	response.sendRedirect("http://banking3.mybluemix.net/sbaccount2.jsp");
%>
</body>
</html>