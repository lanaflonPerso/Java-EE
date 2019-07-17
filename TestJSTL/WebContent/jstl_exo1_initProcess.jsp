<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<strong>Vous avez renseigné les informations suivantes :</strong>
		
		<!-- Les paramètres sont tous dans une Map appelée paramValues, il suffit juste de la parcourir -->
		<c:forEach var="parametre" items="${paramValues}">
			<p>${parametre.key} : <c:forEach var="valeur" items="${parametre.value}">
				${valeur}
			</c:forEach></p>
		</c:forEach>
		
		<strong>Vous vous appelez :</strong>
		<!-- Plus besoin d'aller chercher les valeurs dans la Map paramValues -->
		<p>${param.prenom} ${param.nom}</p>
		
		<strong>Vous avez visité et voyagé en :</strong>
		<c:forEach var="pays" items="${paramValues.pays}">
			<br/>${pays}
		</c:forEach>
		<c:forTokens var="pays" items="${param.autre}" delims=",">
			<br/>${pays}
		</c:forTokens>
	</body>
</html>