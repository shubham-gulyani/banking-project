<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add a loan</title>
</head>
<body bgcolor="orange">

<% //out.println("JSP on cloud"); 
Connection con = null;
try {
	//out.println("Loading Driver.....");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	String jdbcurl = "jdbc:db2://dashdb-entry-yp-dal09-07.services.dal.bluemix.net:50001/BLUDB:sslConnection=true;"; // use ssljdbcurl to connect via SSL
	String user = "dash6138";
	String password =  "T1ukrlbf59ja";
	con = DriverManager.getConnection(jdbcurl, user,password);
	//out.println("connection created....");
	//con.setAutoCommit(false);
     } catch (SQLException e) {
	out.println("SQL Exception: " + e);
	return;
             }
       catch (ClassNotFoundException e) {
	out.println("ClassNotFound Exception: " + e);
	return;
          }
Statement stmt = null;
String sqlStatement = "";
try {
	stmt = con.createStatement();
	
	
	String nm=request.getParameter("t1");
	String ac=request.getParameter("t2");
	String ad=request.getParameter("t3");
	String ph=request.getParameter("t4");
	String bl=request.getParameter("t5");
	String dt=request.getParameter("t6");
	String br=request.getParameter("t7");
	String ty=request.getParameter("s1");
	String em=request.getParameter("t8");
	sqlStatement = "INSERT INTO LOAN2 VALUES('"+nm+"','"+ac+"','"+ad+"','"+ph+"','"+dt+"','"+bl+"','"+br+"','"+ty+"','"+em+"')";
	int f=stmt.executeUpdate(sqlStatement);
	if(f==1)
		out.println("Record inserted....");
	else
		out.println("Record not inserted....");
  } catch (SQLException e) {
	out.println("Error creating statement: " + e);
      }

%>
</body>
</html>