<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistema JSP</title>

<link rel="stylesheet" href="resources/css/cadastro.css">

</head>
<body>
	<a href="index.jsp"><img alt="Início" title="Início" src="resources/img/home.png" width="50px" height="50px"></a>
	<br/>
	
	<div class="containerExterno">
		<div class="containerInterno" style="padding-top: 10%">
			<h3>Bem Vindo ao Sistema!</h3>
			
			<table>
				<tr>
					<td>
						<a href="salvarUsuario?acao=listartodos">
							<img alt="Cadastro de Usuários" title="Cadastro de Usuários" src="resources/img/user.png" width="100px" height="100px">				
						</a>
					</td>
					<td>
						<a href="salvarProduto?acao=listartodos">
							<img alt="Cadastro de Produtos" title="Cadastro de Produtos" src="resources/img/produto.png" width="100px" height="100px">				
						</a>
					</td>
				</tr>
				<tr>
					<td>
						Usuários
					</td>
					<td>
						Produtos
					</td>
				</tr>
			</table>
			
		</div>
	</div>	

</body>
</html>