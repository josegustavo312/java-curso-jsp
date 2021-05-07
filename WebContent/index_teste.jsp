<!-- JavaBeans em JSP -->
<jsp:useBean id="calcula" class="beans.BeanCursoTeste" scope="page"></jsp:useBean>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!-- Tag lib -->
<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld" %>

<!-- Conhecendo o JSTL -->    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Include -->
	<jsp:include page="cabecalho.jsp"></jsp:include>
	<hr/>

	<h1>Bem vindo ao curso de JSP</h1>
	<hr/>
	<%="Seu sucesso garantido!"%>
	<hr/>

	<!-- Passando parâmetro -->
	<form action="receber-nome.jsp" method="post">
		<input type="text" id="nome01" name="nome01">
		<input type="submit" value="Enviar"></input>	
	</form>
	<hr/>
	
	<!-- Tag de expressão e declarativa -->
	<%! 
		int cont = 2; 
	
		public int retorna(int n){
			return n*3;
		}
	%>
	
	<%=cont %>
	<hr/>
	<%=retorna(5)%>
	<hr/>
	<%=application.getInitParameter("estado")%>
	<hr/>
	
	<!-- Sessão -->
	<%session.setAttribute("curso", "curso de jsp"); %>
	
	<!-- Diretivas -->
	<%@ page import="java.util.Date" %>
	<%="Data de hoje: " + new Date() %>
	<hr/>
	
	<%@ page info="Página do curso de jsp" %>
	
	<!-- Include -->
	<%@ include file="pagina-include.jsp" %>
	<hr/>
	
	<!-- Tag lib -->
	<myprefix:minhatag/>
	<hr/>
	
	<!-- JavaBeans em JSP -->
	<%="Calcula: " + calcula.calcula(50) %>
	<hr/>
	
	<!-- Setters e Getters -->
	<form action="receber-nome.jsp" method="post">
		<input type="text" id="nome" name="nome" value="Gustavo">
		<input type="text" id="anos" name="ano" value="1991">
		<input type="text" id="sexo" name="sexo" value="Masculino">
		<input type="submit" value="testar"></input>	
	</form>
	<hr/>	
	
	<!-- Expression language jsp -->
	<form action="receber-nome.jsp" method="post">
		Nome: <input type="text" id="nome" name="nome02">
		Ano: <input type="text" id="anos" name="ano02">
		<input type="submit" value="testar"></input>	
	</form>
	<hr/>
	
	<!-- Conhecendo o JSTL -->
	<c:out value="${'Bem Vindo ao JSTL'}"/>
	<br/><br/>
	
	<!-- Recebe o código da página 
	<c:import var="data" url="https://www.google.com.br"/>
	<c:out value="${data}"/>
	-->
	
	<!-- Remove a expressão
	<c:set var="data" scope="page" value="${500*6}"/>
	<c:remove var="data"/>
	<c:out value="${data}"/>
	<br/>
	-->
	
	<!-- Controle de exceção -->
	<c:catch var="erro">
		<%= 100/0 %>
	</c:catch>
	
	<c:if test="${erro != null}">
		${'Erro: '}
		${erro.message}
	</c:if>
	<br/><br/>
	
	<!-- Condições -->
	<c:set var="numero" value="${100/2}"/>
	<c:choose>
		<c:when test="${numero >= 50}">
			<c:out value="${'Maior ou igual á 50'}"/>
		</c:when>
		<c:when test="${numero < 50}">
			<c:out value="${'Menor que 50'}"/>
		</c:when>
		<c:otherwise>
			<c:out value="${'Não encontrou o valor correto.'}"/>
		</c:otherwise>
	</c:choose>
	<br/><br/>
	
	<!-- For -->
	<c:forEach var="n" begin="1" end="${numero}">
		Item: ${n}
	</c:forEach>
	<br/><br/>
	
	<!-- Tokens -->
	<c:forTokens items="José-Gustavo-Silva" delims="-" var="nome">
		Nome: <c:out value="${nome}"/>
		<br/>
	</c:forTokens>
	<br/>
	
	<!-- Tokens -->
	<c:url value="/acessoLiberado.jsp" var="acesso">
		<c:param name="valor1" value="111"/>
		<c:param name="valor2" value="222"/>
	</c:url>
	${acesso}
	<br/><br/>
	
	<!-- Conhecendo o JSTL -->
	
	<p/>
	<hr/>
	
	<!-- Include -->
	<jsp:include page="rodape.jsp"></jsp:include>
	
</body>
</html>