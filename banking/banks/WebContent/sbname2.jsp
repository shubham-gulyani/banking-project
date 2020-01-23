<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>searching</title>
<script language="javascript">
//var n=document.form1.name.value;
function funalert()
{ var n=document.form1.name.value;
	if(n=="")
	{
		alert("enter name..");
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
<h1> <U> <font face="Lucida Handwriting">SEARCH BY NAME
</font>
</U>
</h1>
<p>
<p>
<p>
<p>
<p>
</center>
 <%
 String name=request.getParameter("name");
%>
 <form name="form1" onsubmit="return funalert()">
ENTER NAME: <input type="text" name="name">
<p>
<input type="submit" value="submit">
</p>
</form>
<%
  // String name=request.getParameter("name");
  out.println("name="+name);
   try{
	   String jdbcurl = "jdbc:db2://dashdb-entry-yp-dal09-07.services.dal.bluemix.net:50001/BLUDB:sslConnection=true;"; // use ssljdbcurl to connect via SSL
		String user = "dash6138";
		String password =  "T1ukrlbf59ja";
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		Connection con=DriverManager.getConnection(jdbcurl,user,password);
	String query="SELECT * FROM MANAGER2 WHERE NAME='"+name+"'";		
	Statement st=con.createStatement();
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
				out.println(e);
			}

%>

</table>
</center>

</body>
</html>