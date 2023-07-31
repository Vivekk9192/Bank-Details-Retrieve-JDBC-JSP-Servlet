<b><h1>
<%
	String username = (String)session.getAttribute("username");
	if (username != null) 
	{
		// out.print("Welcome, " + request.getParameter("name"));
		out.print("Welcome to, " + username);
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
%>
</h1></b>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>View User Information</title>
</head>
<body>
<center><h1>User Information</h1>
<table border="2" style="font-size: 18px;">
	<tr>
		<th scope="col">Borrowed Amount</th>
		<th scope="col">No_of_installments</th>
		<th scope="col">Loan ID</th>
		<th scope="col">Customer ID</th>
		<th scope="col">Loan_Type</th>
	  </tr>
	<tr>
		<%@ page import="java.sql.*"%>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn = DriverManager.getConnection(jdbc:mysql://localhost:3306/vivek1,"","");
		Statement st = cn.createStatement();
        String Sql = "Select * from installments"
		ResultSet rs = st.executeQuery(sql);
		while(rs.next())
		{
			%>
			<td><%out.print(rs.getString(1));%></td>
			<td><%out.print(rs.getString(2));%></td>
			<td><%out.print(rs.getDate(3));%></td>
			<td><%out.print(rs.getString(4));%></td>
			<td><%out.print(rs.getString(5));%></td></tr><%
		}
	}
	catch(Exception e)
	{
		out.println("Error : "+e);
	}
%>
	</tr>
</table>
<br>
<br>
<h2><a href="customerCollectorReport.jsp">Go Back to Main page...</a></h2>
</center>
</body>
</html>