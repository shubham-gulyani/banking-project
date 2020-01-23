<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>searching</title>
<script language="javascript">
//var n=document.form1.acn.value;
function funalert1()
{ 
	var n=document.form2.acc_no.value;
	if(n=="")
	{
		alert("enter account number..");
		window.focus();
		return false;
	}
	
	return true;
}
</script>
</head>
<body bgcolor="orange">
<a href="login.html">LOGOUT</a>
<P>
<P>

<center>
<h1> <U> <font face="Lucida Handwriting">SEARCH BY ACCOUNT NUMBER
</font>
</U>
</h1>
</center>
<p>
<p>
<p>
<p>
<p>

<%
String acc_no=request.getParameter("acc_no");
%>
<form name="form2" onsubmit="return funalert1()">
ENTER ACCOUNT NUMBER: <input type="text" name="acc_no">
<p>
<input type="submit" value="submit">
</p>
</form>
<%
  // String acc_no=request.getParameter("acc_no");
  out.println("acc_no="+acc_no);
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
	query="SELECT * FROM MANAGER1 WHERE ACC_NO='"+acc_no+"' ";		
	st=con.createStatement();
	ResultSet rs=st.executeQuery(query);
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
	
	
	<%	}	
	    } catch (Exception e) {
				out.println("Error creating statement: "+e);
			}

%>
</table>
</center>

</body>
</html>