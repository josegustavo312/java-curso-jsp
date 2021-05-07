<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Produto</title>

<script src="resources/javascript/jquery.min.js" type="text/javascript"></script>
<script src="resources/javascript/jquery.maskMoney.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="resources/css/cadastro.css">

</head>
<body>
	<a href="index.jsp"><img alt="Início" title="Início" src="resources/img/home.png" width="50px" height="50px"></a>
	<a href="acessoliberado.jsp"><img alt="Voltar" title="Voltar" src="resources/img/voltar.png" width="50px" height="50px"></a>
	
	<div class="containerExterno">

		<div class="containerInterno">
	
			<h1>Cadastro de Produto</h1>
			
			<h3 style="color: orange;">${msg}</h3>
			
			<form action="salvarProduto" method="post" id="formProduto" onsubmit="return validarCampos()? true : false;">
				<ul class="form-style-1">
					<li>
						<table>
							<tr>
								<td align="right">Código:</td>
								<td><input type="text" readonly="readonly" id="id" name="id"
									value="${produto.id}" class="field-long"></td>
							</tr>
							<tr>
								<td align="right">Nome:</td>
								<td><input type="text" id="nome" name="nome" maxlength="100"
									value="${produto.nome}" class="field-long"></td>
							</tr>
		
							<tr>
								<td align="right">Quantidade:</td>
								<td><input type="text" id="quantidade" name="quantidade" maxlength="7"
									value="${produto.quantidade}" class="field-long"></td>
							</tr>
							<tr>
								<td align="right">Valor R$:</td>
								<td><input type="text" id="valor" name="valor" maxlength="9"
									value="${produto.valorEmTexto}" class="field-long" data-thousands="." data-decimal=","></td>
							<tr>
							<tr>
								<td align="right">Categoria:</td>
								<td>
									<select id="categorias" name="categoria_id" style="width: 100%">
										<c:forEach items="${categorias}" var="cat">
											<option value="${cat.id}" id="${cat.id}"
												<c:if test="${cat.id == produto.categoria_id}">
													<c:out value="selected=selected" />
												</c:if>
											>
												${cat.nome}
											</option>
										</c:forEach>
									</select>
								</td>
							<tr>
								<td></td>
								<td>
									<input type="submit" style="width: 100px" value="Salvar"> 
									<input type="submit"  style="width: 100px" value="Cancelar" onclick="document.getElementById('formProduto').action = 'salvarProduto?acao=reset'">
								</td>
							</tr>
						</table>
		
					</li>
				</ul>
			</form>
			
		</div>

	</div>
	
	<div class="container">
		<table class="responsive-table">
			<caption>Lista de Produtos</caption>
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Nome</th>
					<th scope="col">Quantidade</th>
					<th scope="col">Valor R$</th>
					<th scope="col">Excluir</th>
					<th scope="col">Editar</th>
				</tr>
			</thead>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td style="width: 150px"><c:out value="${produto.id}">
						</c:out></td>
					<td style="width: 150px"><c:out value="${produto.nome}">
						</c:out></td>
					<td><c:out value="${produto.quantidade}"></c:out></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="2" value="${produto.valor}"></fmt:formatNumber></td>
					
					<td><a href="salvarProduto?acao=delete&produto=${produto.id}" onclick="return confirm('Deseja excluir?')"><img
							src="resources/img/excluir.png" alt="excluir" title="Excluir"
							width="32px" height="32px"> </a></td>
					<td><a href="salvarProduto?acao=editar&produto=${produto.id}"><img
							alt="Editar" title="Editar" src="resources/img/editar.png"
							width="32px" height="32px"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		function validarCampos() {
			if(document.getElementById("nome").value == '') {
				alert("Informe o Nome!");
				return false;
			} else if(document.getElementById("quantidade").value == '') {
				alert("Informe a Quantidade!");
				return false;
			} else if(document.getElementById("valor").value == '') {
				alert("Informe o Valor!");
				return false;
			}
			return true;
		}
	</script>
</body>

<script type="text/javascript">
	$(function() {
		$('#valor').maskMoney();
	})
	
	$(document).ready(function() {
		$("#quantidade").keyup(function(){
			$("#quantidade").val(this.value.match(/[0-9]*/));
		});
	});
</script>

</html>