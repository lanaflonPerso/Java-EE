<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Test</title>
	</head>
	<body>
		<%-- Cette balise affichera le mot 'test' si le bean n'existe pas : --%>
		<c:out value="${bean}">
    		test
		</c:out>

		<%-- Elle peut également s'écrire sous cette forme : --%>
		<c:out value="${bean}" default="test" />
		
		<%-- Sans préciser d'attribut escapeXml : --%>
		<c:out value="<p>Je suis un 'paragraphe'.</p>" />

		<%-- La balise affichera : --%>
		&lt;p&gt;Je suis un &#039;paragraphe&#039;.&lt;/p&gt;

		<%-- Et en précisant l'attribut à false :--%>
		<c:out value="<p>Je suis un 'paragraphe'.</p>" escapeXml="false" />

		<%-- La balise affichera : --%>
		<p>Je suis un 'paragraphe'.</p>
		
		<%-- Cette balise met l'expression "Salut les zéros !" dans l'attribut "message" de la requête : --%>
		<c:set var="message" value="Salut les zéros !" scope="request" />
		
		<%-- Affiche l'expression contenue dans la variable "message" de la requête --%>
		<c:out value="${requestScope.message}" />
		
		<%-- L'attribut scope n'est pas obligatoire. Rappelez-vous, le scope par défaut est dans ce cas la page, 
		puisque c'est le premier dans la liste des scopes parcourus --%>
		<c:set var="maVariable" value="12" />
		
		<%-- Syntaxe aussi possible --%>
		<c:set var="maVariable"> 12 </c:set>
		
		<%-- Récupérer un paramètre de l'URL --%>
		<c:set var="locale" scope="session">
   			<c:out value="${param.lang}" default="FR"/>
		</c:set>
		
		<c:if test="${ 12 > 7 }" var="maVariable2" scope="session">
    		Ce test est vrai.
		</c:if>
		
		<c:out value="${maVariable2}"/>
		
		<%-- Boucle calculant le cube des entiers de 0 à 7 et les affichant dans un tableau HTML --%>
		<table>
  		<tr>
    		<th>Valeur</th>
    		<th>Cube</th>
  		</tr>

		<c:forEach var="i" begin="0" end="7" step="1">
  		<tr>
    		<td><c:out value="${i}"/></td>
    		<td><c:out value="${i * i * i}"/></td>
  		</tr>
		</c:forEach>

		</table>
		
		<%
  		/* Création de la liste et des données */
  		List<Map<String, String>> maListe = new ArrayList<Map<String, String>>();
  		Map<String, String> news = new HashMap<String, String>();
  		news.put("titre", "Titre de ma première news");
  		news.put("contenu", "corps de ma première news");
  		maListe.add(news);
  		news = new HashMap<String, String>();
  		news.put("titre", "Titre de ma seconde news");
  		news.put("contenu", "corps de ma seconde news");
  		maListe.add(news);
  		pageContext.setAttribute("maListe", maListe);
		%>

		<c:forEach items="${maListe}" var="news" varStatus="status">
		<div class="news">
  			News n° <c:out value="${status.count}"/> :
  			<div class="titreNews">
      			<c:out value="${news['titre']}" />
  			</div>
  			<div class="corpsNews">
      			<c:out value="${news['contenu']}" />
  			</div>
		</div>
		</c:forEach>
		
		<p>
		<%-- Affiche les différentes sous-chaînes séparées par une virgule ou un point-virgule --%>
		<c:forTokens var="sousChaine" items="salut; je suis un,gros;zéro+!" delims=";,+">
  			${sousChaine}<br/>
		</c:forTokens>
		</p>
		
		<%-- Génère une url simple, positionnée dans un lien HTML --%>
		<a href="<c:url value="test.jsp" />">lien</a>

		<%-- Génère une url et la stocke dans la variable lien --%>
		<c:url value="test.jsp" var="lien" />
		
		<%-- Redirection avec la balise redirect --%>
		<%-- <c:redirect url="http://www.siteduzero.com"/> --%>


		<%-- Les attributs valables pour <c:url/> le sont aussi pour la redirection. 
		Ici par exemple, l'utilisation de paramètres --%>
		<%-- <c:redirect url="http://www.siteduzero.com">
  			<c:param name="mascotte" value="zozor"/>
  			<c:param name="langue" value="fr"/>
		</c:redirect> --%>
		
		<%-- Importer une page distante dans une variable 
		Le scope par défaut est ici page si non précisé. --%>
		<%-- <c:import url="http://www.siteduzero.com/zozor/biographie.html" var="bio" scope="page"/> --%>

		<%-- Les attributs valables pour <c:url/> le sont aussi pour la redirection. 
		Ici par exemple, l'utilisation de paramètres --%>
		<%-- <c:import url="footer.jsp">
  			<c:param name="design" value="bleu"/>
		</c:import> --%>
	</body>
</html>