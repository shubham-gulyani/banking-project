<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login page</title>
</head>
<body bgcolor="ORANGE">
<%
String user=request.getParameter("userid");
String pas=request.getParameter("pass");
//out.println("password="+pas);
//out.println("user="+user);
 

	 if(user.equals("shweta06")&&pas.equals("1406810902"))
	 {
		 Connection con = null;
		 try{
			 String jdbcurl = "jdbc:db2://dashdb-entry-yp-dal09-07.services.dal.bluemix.net:50001/BLUDB:sslConnection=true;"; // use ssljdbcurl to connect via SSL
				String user1 = "dash6138";
				String password =  "T1ukrlbf59ja";
				Class.forName("com.ibm.db2.jcc.DB2Driver");
			 con=DriverManager.getConnection(jdbcurl,user1,password);
				//out.println("<p>  connection created....");
		 } catch (SQLException e) {
				out.println("SQL Exception: " + e);
				return;
			             }
			       catch (ClassNotFoundException e) {
				out.println("ClassNotFound Exception: " + e);
				return;
			          }
		 Statement s=null;
			String query= "";
			try {
				
				int i;
				
				for(i=12;i<=1200;i+=12)
				{
					Statement stmt = con.createStatement();
					String sqlStatement = "select balance,acc_no from manager1 where add_months(doj,'"+i+"')=sysdate";
					ResultSet rs = stmt.executeQuery(sqlStatement);
					rs.next();
					String b=rs.getString("balance");
					String ac=rs.getString("acc_no");
					double bl=Double.parseDouble(b);
					bl=bl+(bl*0.1);
					String bl1=Double.toString(bl);
				
			 query="UPDATE MANAGER1 SET BALANCE='"+bl1+"' WHERE ACC_NO='"+ac+"'";		
			 s=con.createStatement();
			int f=s.executeUpdate(query);
				}
			}
			catch (Exception e) {
				out.println("Error creating statement: " +e);
			}
		response.sendRedirect("http://banking3.mybluemix.net/show1.html");
		}
	else if(user.equals("shivani09")&&pas.equals("1306810141"))
	{
		 Connection con = null;
		 try{
			 String jdbcurl = "jdbc:db2://dashdb-entry-yp-dal09-07.services.dal.bluemix.net:50001/BLUDB:sslConnection=true;"; // use ssljdbcurl to connect via SSL
				String user1 = "dash6138";
				String password =  "T1ukrlbf59ja";
				Class.forName("com.ibm.db2.jcc.DB2Driver");
			 con=DriverManager.getConnection(jdbcurl,user1,password);
				//out.println("<p>  connection created....");
		 } catch (SQLException e) {
				out.println("SQL Exception: " + e);
				return;
			             }
			       catch (ClassNotFoundException e) {
				out.println("ClassNotFound Exception: " + e);
				return;
			          }
		 Statement s=null;
			String query= "";
			try {
				
				int i;
				
				for(i=12;i<=1200;i+=12)
				{
					Statement stmt = con.createStatement();
					String sqlStatement = "select balance,acc_no from manager2 where add_months(doj,'"+i+"')=sysdate";
					ResultSet rs = stmt.executeQuery(sqlStatement);
					while(rs.next())
						{String b=rs.getString("balance");
					String ac=rs.getString("acc_no");
					double bl=Double.parseDouble(b);
					bl=bl+(bl*0.1);
					String bl1=Double.toString(bl);
				
			 query="UPDATE MANAGER2 SET BALANCE='"+bl1+"' WHERE ACC_NO='"+ac+"'";		
			 s=con.createStatement();
			int f=s.executeUpdate(query);
				}
			}}
			catch (Exception e) {
				out.println("Error creating statement: " +e);
			}
		response.sendRedirect("http://banking3.mybluemix.net/show2.html");
	  }
	  else
	  {
		  out.println("enter a valid user id & password");
	  }
   %>

</body>
</html>