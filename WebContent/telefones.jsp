<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Telefones</title>

<link rel="stylesheet" href="resources/css/cadastro.css">

</head>
<body>	
	<a href="index.jsp"><img alt="Início" title="Início" src="resources/img/home.png" width="50px" height="50px"></a>
	<a href="salvarUsuario?acao=listartodos"><img alt="Voltar" title="Voltar" src="resources/img/voltar.png" width="50px" height="50px"></a>

	<div class="containerExterno">	

		<div class="containerInterno">
		<h1>Cadastro de telefones</h1>
		<br />
		
		<h3 style="color: orange;">${msg}</h3>
	
		<form action="salvarTelefones" method="post" id="formUser" onsubmit="return validarCampos() ? true : false;"> <!-- Ou "return validarCampos()" -->
			<ul class="form-style-1">
				<li>
					<table>
						<tr>
							<td align="right">User:</td>
							<td><input type="text" readonly="readonly" id="id" name="id" value="${userEscolhido.id}" class="field-long"></td>
							<td><input type="text" readonly="readonly" id="nome" name="nome" value="${userEscolhido.nome}" class="field-long"></td>
						</tr>
						<tr>
							<td align="right">Número:</td>
							<td><input type="text" id="numero" name="numero" placeholder="Informe um número"></td>
							<td align="left">
							<select id="tipo" name="tipo">
								<option>Casa</option>
								<option>Contato</option>
								<option>Celular</option>
							</select>
							</td>
						</tr>
						<tr height="50px">
							<td></td>
							<td align="left">
								<input type="submit" value="Salvar">
							</td>
							<td></td>
						</tr>
					</table>
				</li>
			</ul>
		</form>
		
		</div>
	
	</div>

	<div class="container">
		<table class="responsive-table">
			<caption>Telefones cadastrados</caption>
			<thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Número</th>
			      <th scope="col">Tipo</th>
			      <th scope="col">Excluir</th>
			    </tr>
		    </thead>
			
			<c:forEach items="${telefones}" var="fone">
				<tr>
					<td style="width: 150px"><c:out value="${fone.id}"></c:out></td>
					<td style="width: 150px"><c:out value="${fone.numero}"></c:out></td>
					<td><c:out value="${fone.tipo}"></c:out></td>

					<td><a href="salvarTelefones?acao=deleteFone&id=${fone.id}" onclick="return confirm('Deseja excluir?')"> <img alt="Excluir" title="Excluir" src="resources/img/excluir.png" width="32px" height="32px"> </a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script type="text/javascript">
		function validarCampos(){
			if(document.getElementById("numero").value == ''){
				alert('Informe o Número!');
				document.getElementById("numero").focus();
				return false;
				
			}else if(document.getElementById("tipo").value == ''){
				alert('Informe o Tipo!');
				document.getElementById("tipo").focus();
				return false;
			}
			
			return true;
		}
	</script>
	
</body>
</html>