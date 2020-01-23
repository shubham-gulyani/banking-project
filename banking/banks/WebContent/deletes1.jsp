<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
      <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>deleted</title>
</head>
<body bgcolor="orange">
<%
  String ac=request.getParameter("acc_no");

  Connection con = null;
   try{
	   String jdbcurl = "jdbc:db2://dashdb-entry-yp-dal09-07.services.dal.bluemix.net:50001/BLUDB:sslConnection=true;"; // use ssljdbcurl to connect via SSL
		String user = "dash6138";
		String password =  "T1ukrlbf59ja";
		Class.forName("com.ibm.db2.jcc.DB2Driver");
	 con=DriverManager.getConnection(jdbcurl,user,password);
		//out.println("<p>  connection created....");
   } catch (SQLException e) {
		out.println("SQL Exception: " + e);
		return;
	             }
	       catch (ClassNotFoundException e) {
		out.println("ClassNotFound Exception: " + e);
		return;
	          }
	Statement s = null;
	String query= "";
	try {
		
	 query="delete from manager1  WHERE ACC_NO='"+ac+"'";		
	 s=con.createStatement();
	int f=s.executeUpdate(query);
	if(f==1)
		out.println("account deleted");

	else

		out.println("account not deleted");
	con.close();
	    } catch (Exception e) {
				out.println("Error creating statement: " +e);
			}

%>



</body>
</html>