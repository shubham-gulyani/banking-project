<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>my database</title>
</head>
<body bgcolor="orange">
<h1> <U> <font face="Lucida Handwriting">SORTED DATA
</font>
</U>
</h1>
<p>
<p>
<p>
<p>
<p>

<% //out.println("JSP on cloud"); 
Connection con = null;
try {
	//out.println("Loading Driver.....");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	 String jdbcurl = "jdbc:db2://dashdb-entry-yp-dal09-07.services.dal.bluemix.net:50001/BLUDB:sslConnection=true;"; // use ssljdbcurl to connect via SSL
		String user = "dash6138";
		String password =  "T1ukrlbf59ja";
		con = DriverManager.getConnection(jdbcurl, user,password);
	//out.println("<p>  connection created....");
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
	sqlStatement = "select * from manager1 order by doj desc";
	ResultSet rs = stmt.executeQuery(sqlStatement);
	%>
	<center><table border=1>
	<tr>
	   <th>NAME</th>
	   <th>ACCOUNT NUMBER</th>
	   <th>ADDRESS</th>
	   <th>PHONE NUMBER</th>
	   <th>BRANCH</th>
	   <th>BALANCE</th>
	   <th>JOINING DATE</th>
	   <th>EMAIL ID</th>
	</tr>
	<%
	   while(rs.next())
	   {
	%>
	   <tr>
	      <td><% out.println(rs.getString("NAME")); %></td>
	      <td><% out.println(rs.getString("ACC_NO")); %></td>
	      <td><% out.println(rs.getString("ADDRESS")); %></td>
	      <td><% out.println(rs.getString("PHONE")); %></td>
	      <td><% out.println(rs.getString("BRANCH")); %></td>
	      <td><% out.println(rs.getString("BALANCE")); %></td>
	      <td><% out.println(rs.getString("DOJ")); %></td>
	       <td><% out.println(rs.getString("EMAIL")); %></td>
	   </tr>
	
<% 

	   }
}catch (SQLException e) {
	out.println("Error creating statement: " + e);
      }

%>

</body>
</html>