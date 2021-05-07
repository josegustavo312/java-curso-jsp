<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Conhecendo o JSTL -->    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forwards</title>
</head>
<body>	
	<!-- Redirect -->
	<c:set var="numero" value="${1}"/>
	<c:if test="${numero == 1}">
		<c:redirect url="acessoliberado.jsp"/>
	</c:if>
	<c:if test="${numero == 0}">
		<c:redirect url="https://www.jdevtreinamento.com.br/"/>
	</c:if>	
</body>
</html>