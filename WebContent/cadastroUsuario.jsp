<%@page import="beans.BeanCursoJsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Usuário</title>

<link rel="stylesheet" href="resources/css/cadastro.css">

<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
         integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
         crossorigin="anonymous"></script>
         
</head>
<body>
	<a href="index.jsp"><img alt="Início" title="Início" src="resources/img/home.png" width="50px" height="50px"></a>
	<a href="acessoliberado.jsp"><img alt="Voltar" title="Voltar" src="resources/img/voltar.png" width="50px" height="50px"></a>

	<div class="containerExterno">

		<div class="containerInterno">
		
		<h1>Cadastro de usuário</h1>
		<br />
		
		<h3 style="color: orange;">${msg}</h3>
	
		<form action="salvarUsuario" method="post" id="formUser" onsubmit="return validarCampos() ? true : false;" enctype="multipart/form-data">
			<ul class="form-style-1">
				<li>
					<table>
						<tr>
							<td align="right">Perfil:</td>
							<td align="left">
								<select id="perfil" name="perfil" style="width: 100%;">
								
									<option value="nao_informado">[--Selecione--]</option>
									
									<option value="administrador"
										<%
										if(request.getAttribute("user") != null){
											BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
											
											if(user.getPerfil().equals("administrador")){
												out.print(" ");
												out.print("selected=\"selected\"");
												out.print(" ");
											}
										}
										%>
									>Administrador</option>
									
									<option value="secretario"
										<%
										if(request.getAttribute("user") != null){
											BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
											
											if(user.getPerfil().equals("secretario")){
												out.print(" ");
												out.print("selected=\"selected\"");
												out.print(" ");
											}
										}
										%>
									>Secretário(a)</option>
									
									<option value="gerente"
										<%
										if(request.getAttribute("user") != null){
											BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
											
											if(user.getPerfil().equals("gerente")){
												out.print(" ");
												out.print("selected=\"selected\"");
												out.print(" ");
											}
										}
										%>
									>Gerente</option>
									
									<option value="funcionario"
										<%
										if(request.getAttribute("user") != null){
											BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
											
											if(user.getPerfil().equals("funcionario")){
												out.print(" ");
												out.print("selected=\"selected\"");
												out.print(" ");
											}
										}
										%>
									>Funcionário</option>
									
								</select>
							</td>		
						</tr>
						<tr>
							<td align="right">Código:</td>
							<td><input type="text" readonly="readonly" id="id" name="id" class="field-long" value="${user.id}"></td>
							
							<td align="right">Rua:</td>
							<td><input type="text" id="rua" name="rua" class="field-long" value="${user.rua}"></td>
						</tr>
						<tr>
							<td align="right">Login:</td>
							<td><input type="text" id="login" name="login" placeholder="Informe um login"  class="field-long" value="${user.login}" maxlength="20"></td>
							
							<td align="right">Bairro:</td>
							<td><input type="text" id="bairro" name="bairro" class="field-long" value="${user.bairro}"></td>
						</tr>
						<tr>
							<td align="right">Senha:</td>
							<td><input type="password" id="senha" name="senha" placeholder="Informe um senha" class="field-long" value="${user.senha}" maxlength="20"></td>
							
							<td align="right">Cidade:</td>
							<td><input type="text" id="cidade" name="cidade" class="field-long" value="${user.cidade}"></td>
						</tr>
						<tr>
							<td align="right">Nome:</td>
							<td><input type="text" id="nome" name="nome"  placeholder="Informe um nome" class="field-long" value="${user.nome}" maxlength="50"></td>
							
							<td align="right">Estado:</td>
							<td><input type="text" id="estado" name="estado" class="field-long" value="${user.estado}"></td>
						</tr>
						<tr>
							<td align="right">Cep:</td>
							<td><input type="text" id="cep" name="cep" placeholder="Informe um CEP válido" onblur="consultaCep()" class="field-long" value="${user.cep}"></td>
							
							<td align="right">IBGE:</td>
							<td><input type="text" id="ibge" name="ibge" class="field-long" value="${user.ibge}"></td>
						</tr>
						<tr>
							<td align="right">Ativo:</td>
							<td align="left">
								<input type="checkbox" id="ativo" name="ativo"
									<%
										if(request.getAttribute("user") != null){
											BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
											
											if(user.isAtivo()){
												out.print(" ");
												out.print("checked=\"checked\"");
												out.print(" ");
												
											}
										}
									%>
								>
							</td>
							<td align="right">Sexo:</td>
							<td align="left">
								<input type="radio" name="sexo" value="masculino"
									<%
										if(request.getAttribute("user") != null){
											BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
											
											if(user.getSexo().equals("masculino")){
												out.print(" ");
												out.print("checked=\"checked\"");
												out.print(" ");
											}
										}
									%>
								>Masculino
								<input type="radio" name="sexo" value="feminino"
									<%
										if(request.getAttribute("user") != null){
											BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
											
											if(user.getSexo().equals("feminino")){
												out.print(" ");
												out.print("checked=\"checked\"");
												out.print(" ");
											}
										}
									%>
								>Feminino
							</td>
						</tr>
						<tr>
							<td align="right">Foto:</td>
							<td>
								<input type="file" name="foto">
							</td>
							
							<td align="right">Currículo:</td>
							<td>
								<input type="file" name="curriculo" value="curriculo">
							</td>							
						</tr>
						<tr height="50px">
							<td></td>
							<td>
								<input type="submit" value="Salvar" style="width: 50%">
							</td>
							<td></td>
							<td>
								<input type="submit" value="Cancelar" style="width: 50%" onclick="document.getElementById('formUser').action='salvarUsuario?acao=reset'">
							</td>
						</tr>
					</table>
				</li>
			</ul>
		</form>
		
		<form action="servletPesquisa" method="post">
			<ul class="form-style-1">
				<li>
					<table>
						<tr>
							<td>Descrição:</td>
							<td style="width: 100%">
								<input type="text" id="descricaoConsulta" name="descricaoConsulta" style="width: 100%">
							</td>
							<td>
								<input type="submit" value="Pesquisar">
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
			<caption>Lista de Usuários</caption>
			<thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Foto</th>
			      <th scope="col">Currículo</th>
			      <th scope="col">Nome</th>
			      <th scope="col">Telefones</th>
			      <th scope="col">Excluir</th>
			      <th scope="col">Editar</th>			      
			    </tr>
		    </thead>
			
			<c:forEach items="${usuarios}" var="user">
				<tr>
					<td style="width: 150px"><c:out value="${user.id}"></c:out></td>
					
					<c:if test="${user.fotoBase64Miniatura.isEmpty() == false}">
						<td><a href="salvarUsuario?acao=download&tipo=imagem&id=${user.id}"><img src='<c:out value="${user.fotoBase64Miniatura}"/>' alt="Foto" title="Imagem do usuário" width="32px" height="32px"></a></td>
					</c:if>
					<c:if test="${user.fotoBase64Miniatura == null}">
						<td><img src="resources/img/userpadrao.png" alt="Imagem padrão" title="Imagem padrão" width="32px" height="32px" onclick="alert('Usuário Não Tem Foto.')"></td>
					</c:if>
					
					<c:if test="${user.curriculoBase64.isEmpty() == false}">
						<td><a href="salvarUsuario?acao=download&tipo=curriculo&id=${user.id}"> <img src="resources/img/pdf.png" alt="Currículo" title="Currículo" width="32px" height="32px"> </a></td>
					</c:if>
					<c:if test="${user.curriculoBase64 == null}">
						<td><img src="resources/img/pdfPadrao.png" alt="Currículo" title="Currículo" width="32px" height="32px" onclick="alert('Usuário Não Tem Currículo.')"></td>
					</c:if>
					
					<td><c:out value="${user.nome}"></c:out></td>
					
					<td><a href="salvarTelefones?acao=addFone&id=${user.id}"> <img alt="Telefones" title="Telefones" src="resources/img/telefones.png" width="32px" height="32px"> </a></td>
					<td><a href="salvarUsuario?acao=delete&id=${user.id}" onclick="return confirm('Deseja excluir?')"> <img alt="Excluir" title="Excluir" src="resources/img/excluir.png" width="32px" height="32px"> </a></td>
					<td><a href="salvarUsuario?acao=editar&id=${user.id}"> <img alt="Editar" title="Editar" src="resources/img/editar.png" width="32px" height="32px"> </a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script type="text/javascript">
	
		function validarCampos() {
			var radioSexo = document.getElementsByName("sexo");
			var radioSelecionado = 0;
			
			for (var i = 0; i < radioSexo.length; i++) {
		        if (radioSexo[i].checked) {
		        	radioSelecionado = 1;
		        }
		    }
			
			if(document.getElementById("perfil").value == 'nao_informado') {
				alert("Informe o Perfil!");				
				return false;
				
			}else if(document.getElementById("login").value == '') {
				alert("Informe o Login!");				
				return false;
				
			}else if (document.getElementById("senha").value == '') {
				alert("Informe a Senha!");
				return false;
				
			}else if (document.getElementById("nome").value == '') {
				alert("Informe o Nome!");
				return false;
				
			}else if (radioSelecionado == 0) {
				alert("Informe o Sexo!");
				return false;
				
			}
			
			return true;
			
		}
	
		function consultaCep(){
			//Nova variável "cep" somente com dígitos.
            var cep = $("#cep").val().replace(/\D/g, '');
			
          	//Verifica se campo cep possui valor informado.
            if (cep != "") {

                //Expressão regular para validar o CEP.
                var validacep = /^[0-9]{8}$/;

                //Valida o formato do CEP.
                if(validacep.test(cep)) {

                    //Consulta o webservice viacep.com.br/
                    $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                        if (!("erro" in dados)) {
                            //Atualiza os campos com os valores da consulta.
                            $("#rua").val(dados.logradouro);
                            $("#bairro").val(dados.bairro);
                            $("#cidade").val(dados.localidade);
                            $("#estado").val(dados.uf);
                            $("#ibge").val(dados.ibge);
                        } //end if.
                        
                        else {
                            //CEP pesquisado não foi encontrado.
                            $("#cep").val('');
                            $("#rua").val('');
                            $("#bairro").val('');
                            $("#cidade").val('');
                            $("#estado").val('');
                            $("#ibge").val('');
                            
                            alert("CEP não encontrado.");
                        }
                    });
                } //end if.
                
                else {
                    //cep é inválido.
                    alert("Formato de CEP inválido.");
                }
            } //end if.
            
            else {
                //cep sem valor
            	alert("Cep sem valor!");
            }
			
		}
	</script>
	
</body>
</html>