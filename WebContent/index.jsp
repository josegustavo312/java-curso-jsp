<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Início</title>

<link rel="stylesheet" href="resources/css/estilo.css">

</head>
<body>

	<center><h4>Projeto Didático</h4></center>
		
	<center><h1>JSP + Servlet + JDBC</h1></center>
		
	<div class="login-page">
		
		<div class="form">

			<form action="LoginServlet" method="post" class="login-form">
				<p class="message">Acesso ao sistema JSP </p><br/>
				<input type="text" id="login" name="login" placeholder="Login"> <br />
				<input type="password" id="senha" name="senha" placeholder="Senha"> <br />
				<button type="submit" value="Logar">Logar</button>
			</form>

		</div>		
		
	</div>
	
	<center><h3><a style="text-decoration: none;" href="https://www.jdevtreinamento.com.br/">Formação Java Web</a></h3></center>

</body>
</html>