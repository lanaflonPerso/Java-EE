<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:import url="jstl_exo2_inventaire.xml" varReader="xmlFile">
   			<%-- Parse le contenu du fichier XML dans une variable nommée 'doc' --%>
   			<x:parse var="doc" doc="${xmlFile}" ></x:parse>
		</c:import>
		
		<!-- Affiche les titres de tous les livres -->
		<strong>Titres des livres :</strong>
		<p><x:forEach var="element" select="$doc/inventaire/livre">
   			<x:out select="$element/titre" ></x:out><br/>
		</x:forEach></p>
		
		<!-- Affiche un message d'alerte pour chaque livre ayant un stock inférieur à leur minimum -->
		<p><x:forEach var="element" select="$doc/inventaire/livre">
			<x:if select="$element[stock < minimum]">
   				Attention, ce livre va bientôt être en rupture de stock : 
   				<x:out select="$element/titre" ></x:out><br/>
			</x:if>
		</x:forEach></p>
	</body>
</html>