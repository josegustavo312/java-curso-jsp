<!-- JavaBeans em JSP -->
<jsp:useBean id="calcula" class="beans.BeanCursoTeste" type="beans.BeanCursoTeste" scope="page"></jsp:useBean>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<!-- Passando parâmetro -->
	<%="Nome recebido: " + request.getParameter("nome01")%>
	<hr/>
	
	<!-- Objetos implícitos -->
	<%="Implícito: " + request.getContextPath()%>
	<hr/>
	
	<!-- Sessão -->
	<%= "Sessão: " + session.getAttribute("curso")%>
	<hr/>
	
	<!-- Diretivas -->
	<%= "Info: " + getServletInfo()%>
	<hr/>
	
	<!-- Forwards -->
	<%="Parâmetro: " + request.getParameter("paramforward")%>
	<hr/>
	
	<!-- Setters e Getters -->
	<jsp:setProperty property="*" name="calcula"/>
	Nome:
	<jsp:getProperty property="nome" name="calcula"/>
	- Ano:
	<jsp:getProperty property="ano" name="calcula"/>
	- Sexo:
	<jsp:getProperty property="sexo" name="calcula"/>
	<hr/>
	
	<!-- Expression language jsp -->
	Nome: ${param.nome02}
	<br/>
	Ano: ${param.ano02}
	<br/>
	Sessão: ${sessionScope.curso}
	
</body>
</html>