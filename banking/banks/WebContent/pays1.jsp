<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
      <%@ page import="java.lang.*" %>
        <%@ page import="com.sendgrid.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>interest paid</title>
</head>
<body bgcolor="orange">
<%
String d=request.getParameter("debit");
float de=Float.parseFloat(request.getParameter("debit"));
  String ac=request.getParameter("acn");
  out.println("amount="+de);
  Connection con = null;
   try{
	   String jdbcurl = "jdbc:db2://dashdb-entry-yp-dal09-07.services.dal.bluemix.net:50001/BLUDB:sslConnection=true;"; // use ssljdbcurl to connect via SSL
		String user = "dash6138";
		String password =  "T1ukrlbf59ja";
		Class.forName("com.ibm.db2.jcc.DB2Driver");
	 con=DriverManager.getConnection(jdbcurl,user,password);
	//	out.println("<p>  connection created....");
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
		Statement stmt = con.createStatement();
		String sqlStatement = "select email,balance from loan1 where acc_no='"+ac+"'";
		ResultSet rs = stmt.executeQuery(sqlStatement);
		rs.next();
		String id=rs.getString("email");
		String b=rs.getString("balance");
		float bl=Float.parseFloat(b);
		bl=bl-de;
		String bl1=Float.toString(bl);
	 query="UPDATE LOAN1 SET BALANCE='"+bl1+"'  WHERE ACC_NO='"+ac+"'";		
	 s=con.createStatement();
	int f=s.executeUpdate(query);
	if(f==1)
	{
		out.println("amount paid");
	
		Properties props = new Properties();

		props.put("mail.smtp.host", "smtp.sendgrid.net");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");

		SendGrid sendgrid = new SendGrid("m_rawat_miet", "ayushdps1");

		SendGrid.Email email = new SendGrid.Email();
		
		email.addTo(id);
		
		email.setFrom("m_rawat_miet@sendgrid.net");
		
		email.setSubject("loan payment information");
		
		email.setHtml("dear customer, your have made a payment of rs."+d+".your remaining loan amount is"+bl1+".have a nice day");

		SendGrid.Response res = sendgrid.send(email);
		out.println(res.getMessage());
	}
	else

		out.println("amount not paid");
	con.close();
	    } catch (Exception e) {
				out.println("Error creating statement: " +e);
			}

%>



</body>
</html>