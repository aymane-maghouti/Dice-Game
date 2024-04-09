<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.bo.GameState"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Game App</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/style/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/style/signin.css"
	rel="stylesheet">
</head>
<body>

	Bonjour
	<c:out value="${sessionScope.gameState.user.nom}" /><br>
	
	<a href="${pageContext.request.contextPath}/back/bestScore">Meilleurs scores</a>|
	<a href="${pageContext.request.contextPath}/back/ReinitGameServlet">R�initialiser le jeu</a>|
	<a href="${pageContext.request.contextPath}/DeconnectServlet">Se deconnecter</a> |
	<a href="${pageContext.request.contextPath}/back/myBestScore">Mon meilleur Score</a> |	
		
	




	<h1>Mon meilleur Score (Avec Java)</h1>

	<%
		GameState gameState = (GameState) request.getSession().getAttribute("gameState");

		if (gameState != null && gameState.getUser() != null) {
			out.print(Math.max(gameState.getUser().getBestScore(), gameState.getUser().getScore()));
		}
	%>


	<h1>Mon meilleur Score (Avec JSTL)</h1>
	<c:choose>
	<c:when test="${sessionScope.gameState.user.bestScore > sessionScope.gameState.user.score}">
					   ${sessionScope.gameState.user.bestScore}
	</c:when>
				
	<c:otherwise>
					    ${sessionScope.gameState.user.score}
	</c:otherwise>
		</c:choose>


	<h1>Jeu de d�</h1>


	<form action="${pageContext.request.contextPath}/back/GameServlet">
		<input type="submit" value="Envoyer" />
	</form>

	<%
		out.print(gameState);
	%>

</body>
</html>