<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
      <%@ page import="java.lang.*" %>			
      <%@ page import="java.util.Map,java.util.HashMap,com.twilio.sdk.resource.instance.Account,com.twilio.sdk.TwilioRestClient,com.twilio.sdk.TwilioRestException,com.twilio.sdk.resource.factory.MessageFactory,com.twilio.sdk.resource.instance.Message,java.util.ArrayList,java.util.List,org.apache.http.NameValuePair,org.apache.http.message.BasicNameValuePair" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>debit page</title>

</head>
<body bgcolor="orange">

<%
String d=request.getParameter("debit");
float de=Float.parseFloat(request.getParameter("debit"));
  String ac=request.getParameter("acn");
  out.println("credit="+de);
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
	Statement st = null;
	String query = "";
	try{ 
		Statement stmt = con.createStatement();
		String sqlStatement = "select phone,balance from manager2 where acc_no='"+ac+"'";
		ResultSet rs = stmt.executeQuery(sqlStatement);
		rs.next();
		String ph=rs.getString("phone");
		String b=rs.getString("balance");
		float bl=Float.parseFloat(b);
		bl=bl+de;
		String bl1=Float.toString(bl);
		query="UPDATE MANAGER2 SET BALANCE='"+bl1+"' WHERE ACC_NO='"+ac+"'";		
			st=con.createStatement();
			
	 int f=st.executeUpdate(query);
	 if(f==1)
	 {
			out.println("amount credited");
					 
					   /* Find your sid and token at twilio.com/user/account */
					    String ACCOUNT_SID = "AC38749ee50a5902662a89c4462b822e83";
					    String AUTH_TOKEN = "ccd46cf6b12635a59709f94ef2cee1c2";
					 
					  
					        TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
					 
					        Account account = client.getAccount();
					 
					        MessageFactory messageFactory = account.getMessageFactory();
					        List<NameValuePair> params = new ArrayList<NameValuePair>();
					        params.add(new BasicNameValuePair("To", ph)); // Replace with a valid phone number for your account.
					        params.add(new BasicNameValuePair("From", "+12017780704")); // Replace with a valid phone number for your account.
					        params.add(new BasicNameValuePair("Body", "dear customer, your account has been credited with rs."+d+".your available balance is"+bl1+".have a nice day"));
					        Message sms = messageFactory.create(params);
					       out.println(sms);	
					    }
					

	 else
out.println("amount not credited");

	con.close();
	    } catch (Exception e) {
				out.println("Error creating statement: " +e);
			}
%>

</body>
</html>