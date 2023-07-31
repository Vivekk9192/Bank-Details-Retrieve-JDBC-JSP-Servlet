<%@include file="bank.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bank details</title>
<style type="text/css">
	.jumbotron{
	min-height: 200 px;
	padding:1rem;
	}
</style>
</head>
<body>
	<%
		if(session.getAttribute("username")==null){
			response.sendRedirect("login.jsp");
		}
	%>
	<%
	response.setHeader("Cache-control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
	%>
	<div class="container">
		<br><br>
		<p class="font-weight-bolder text-left"><h4><u>Customer Collector Report</u></h4></p>
		<div class="container">
			<form action="customerCollectorReport.jsp" method="get">
				<div class="form-check form-check-inline col-md-4 float-right">
					<input class="form-check-input" type="radio" name="options" id="inlineRadio1" value="1">
					<label class="form-check-label" for="inlineRadio1">View Individual Collector Report</label>
				  </div>
				  <div class="form-check form-check-inline col-md-4 float-right">
					<input class="form-check-input" type="radio" name="options" id="inlineRadio2" value="2">
					<label class="form-check-label" for="inlineRadio2">Collectors report for Jewel loan</label>
				  </div>
				  <div class="form-check form-check-inline col-md-3 float-right">
					<input class="form-check-input" type="radio" name="options" id="inlineRadio3" value="3">
					<label class="form-check-label" for="inlineRadio3">Collectors report for Credit loan</label>
				  </div>
				<br><br>
				<div class="form-row">
					<div class="col-md-4">
						<div class="jumbotron">
							<div class="container" >
								<p class="lead">Collector Name</p>
								<hr class="my-4">
								<input type="text" name="cName" class="form-control">
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="row">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-4 float-right">
								From: <input type="date" class="datepicker" data-date-format="mm/dd/yyyy" name="from">
							</div>
							<div class="form-group col-md-4 float-right">
								To: <input type="date" class="datepicker" data-date-format="mm/dd/yyyy" name="to">
							</div>
						</div>
						<div class="form-row"></div>
						<div class="row">
							<div class="col-4"></div>
							<div class="form-row"></div>
							<button type="submit" class="btn btn-dark">Generate Report</button>
						</div>
					</div>
				</div>
			
		</form>
	</div>
		<% 
		String s=request.getParameter("options");
		if(s==null) System.out.println("Select some option");
		else{
			String to=request.getParameter("to");
			String fromDate=request.getParameter("from");
			String cName=request.getParameter("cName");
			if(fromDate.equals("")) fromDate="1999-03-03";
			if(to.equals("")) to="2030-03-03";
			if(s.equals("1")){
			String sql="select borrowed_amount,no_of_installments,date_of_payment,loans.loan_id,(select name from borrower where borrower.b_id=loans.b_id),loans.b_id,(select name from collector where collector.collector_id=loans.collector_id),loans.collector_id,loans.loan_type from installments left join loans on loans.loan_id=installments.loan_id where date_of_payment > \'"+fromDate+"\' AND date_of_payment < \'"+to+"\' AND collector_name like \'%"+cName+"%\'";

			
	%>
	<table class="table">
		<thead class="thead-dark">
		  <tr>
			<th scope="col">#</th>
			<th scope="col">Borrowed Amount</th>
			<th scope="col">No_of_installments</th>
			<th scope="col">Date</th>
			<th scope="col">Loan ID</th>
			<th scope="col">Customer</th>
			<th scope="col">Customer ID</th>
			<th scope="col">Collector</th>
			<th scope="col">Collector ID</th>
			<th scope="col">Loan_Type</th>
		  </tr>
		</thead>
		<tbody>
			<%@page import="java.sql.*" %>
		  <%
		  try{
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vivek1","root","");
				PreparedStatement st=con.prepareStatement(sql);
				ResultSet rs=st.executeQuery();int i=1;
	 			while(rs.next()){
					out.println("<tr> <th scope=\"row\">"+i+"</th>");
		  			out.println("<td>"+rs.getString(1) +"</td>");
		  			out.println("<td>"+rs.getString(2) +"</td>");
		  			out.println("<td>"+rs.getDate(3) +"</td>");
		  			out.println("<td>"+rs.getString(4) +"</td>");
		  			out.println("<td>"+rs.getString(5) +"</td>");
		  			out.println("<td>"+rs.getString(6) +"</td>");
		  			out.println("<td>"+rs.getString(7) +"</td>");
		  			out.println("<td>"+rs.getString(8) +"</td>");
		  			out.println("<td>"+rs.getString(9) +"</td>");
		  			out.println("</tr");
		  			i++;
	 			}
	 			con.close();
	  		}catch(Exception e){System.out.println(e);}}
		  %>
		  </tbody>
		 </table>
		 <%
		 if(s.equals("2")){
			
			String sql="select borrowed_amount, no_of_installments,date_of_payment,loans.loan_id,loans.collector_id, (select name from collector where collector.collector_id=loans.collector_id) as collector_name from installments left join loans on loans.loan_id=installments.loan_id where loan_type='Jewel' AND date_of_payment > \'"+fromDate+"\' AND date_of_payment < \'"+to+"\' AND collector_name like \'%"+cName+"%\'";
		  %>
		
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Borrowed Amount</th>
			  <th scope="col">No_of_installments</th>
			  <th scope="col">Date_of_payment</th>
		      <th scope="col">Loan ID</th>
		      <th scope="col">Collector ID</th>
		      <th scope="col">Collector Name</th>
		    </tr>
		  </thead>
		  <tbody>
		<%@page import="java.sql.*" %>
		  <%    try{
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vivek1","root","");
				PreparedStatement st=con.prepareStatement(sql);
				ResultSet rs=st.executeQuery();int i=1;
	 			while(rs.next()){
		  			out.println("<tr> <th scope=\"row\">"+i+"</th>");
		  			out.println("<td>"+rs.getString(1) +"</td>");
					out.println("<td>"+rs.getString(2) +"</td>");
					out.println("<td>"+rs.getDate(3) +"</td>");
					out.println("<td>"+rs.getString(4) +"</td>");
		  			out.println("<td>"+rs.getString(5) +"</td>");
		  			out.println("<td>"+rs.getString(6) +"</td>");
		  			out.println("</tr");
		  			i++;
	 			}
	 			con.close();
	  		}catch(Exception e){System.out.println(e);}}
		  	%> 
		  	</tbody>
		  	</table>
			  <% 
			  if(s.equals("3")){
				  String sql="select borrowed_amount, no_of_installments,date_of_payment,loans.b_id,(select name from borrower where borrower.b_id=loans.b_id),loans.collector_id, (select name from collector where collector.collector_id=loans.collector_id) from installments left join loans on loans.loan_id=installments.loan_id where loan_type='cc' AND date_of_payment > \'"+fromDate+"\' AND date_of_payment < \'"+to+"\' AND collector_name like \'%"+cName+"%\'";
		   %>
		   <table class="table">
			<thead class="thead-dark">
			  <tr>
				<th scope="col">#</th>
				<th scope="col">Borrowed Amount</th>
				<th scope="col">No_of_installments</th>
				<th scope="col">Date_of_payment</th>
				<th scope="col">Borrowed ID</th>
				<th scope="col">Borrower Name</th>
				<th scope="col">Collector ID</th>
				<th scope="col">Collector Name</th>
			  </tr>
			</thead>
			<tbody>
		  <%@page import="java.sql.*" %>
			<%    try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vivek1","root","");
				  PreparedStatement st=con.prepareStatement(sql);
				  ResultSet rs=st.executeQuery();int i=1;
				   while(rs.next()){
						out.println("<tr> <th scope=\"row\">"+i+"</th>");
						out.println("<td>"+rs.getString(1) +"</td>");
						out.println("<td>"+rs.getString(2) +"</td>");
						out.println("<td>"+rs.getDate(3) +"</td>");
						out.println("<td>"+rs.getString(4) +"</td>");
						out.println("<td>"+rs.getString(5) +"</td>");
						out.println("<td>"+rs.getString(6) +"</td>");
						out.println("<td>"+rs.getString(7) +"</td>");
						out.println("</tr");
						i++;
				   }
					con.close();
				}catch(Exception e){System.out.println(e);}
				%> 
				</tbody>
				</table>
			  <% }}%>
	</div>
	</body>
</html>