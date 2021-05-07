<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forwards</title>
</head>
<body>
	<!-- Forwards -->
	<jsp:forward page="receber-nome.jsp">
		<jsp:param value="Curso de JSP" name="paramforward"/>
	</jsp:forward>	
</body>
</html>