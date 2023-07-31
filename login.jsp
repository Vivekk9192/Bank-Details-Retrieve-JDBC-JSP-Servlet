<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Login Page</title>
		<style>
			body {
				background-color: blanchedalmond;
			}

			fieldset {
				width: 30%;
				border-radius: 15px;
			}

			legend {
				text-align: center;
			}

			.btn {
				height: 40px;
				width: 100px;
				font-size: 15px;
				justify-content: center;
				font-size: x-large;
				border-radius: 15px;
				background-color: #0c4202;
				color: rgb(0, 0, 0);
				font-weight: bold;
			}
			input{
				border-radius: 15px;
				height: 20px;
				width: 190px;
			}
		</style>
	</head>

	<body>
		<fieldset>
			<legend>
				<h1>Login Details</h1>
			</legend>
			<form action="/examples/Loginnn" method="post">
				<b>Enter username: </b><input type="text" name="userName" placeholder="Enter Your Username"><br><br>
				<b>Enter password: </b><input type="password" name="pwd" placeholder="Enter Your Password"><br><br>
				<input class="btn" type="submit" value="Login">
			</form>
		</fieldset>
	</body>

	</html>