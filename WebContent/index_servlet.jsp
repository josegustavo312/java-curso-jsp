<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<h3>Acesso ao sistema JSP</h3>
	
	<form action="LoginServletTeste" method="post">
		Login:
		<input type="text" id="login" name="login">
		<br/>
		Senha:
		<input type="password" id="senha" name="senha">
		<br/>
		<input type="submit" value="Logar">
	</form>
	
</body>
</html>