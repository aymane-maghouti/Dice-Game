<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.bo.Message"%>
<%@page import="com.bo.GameState"%>
<%@page import="com.bo.Utilisateur"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jeu de Des</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        padding: 20px;
    }
    
    h1{
    text-align : center;
    }
    
</style>
</head>
<body>
    <div class="container">
        <h1>Partie Terminée !</h1>
        <div class="row">
            <div class="col">
                <c:set var="v1" value="${requestScope.ValueD1}" />
                <c:set var="v2" value="${requestScope.ValueD2}" />
                <c:set var="v3" value="${requestScope.ValueD3}" />

                <c:if test="${v1 != -1}">
                    <p>Votre lancé de Dé 1 est <c:out value="${v1}" /></p>
                </c:if>

                <c:if test="${v2 != -1}">
                    <p>Votre lancé de Dé 2 est <c:out value="${v2}" /></p>
                </c:if>

                <c:if test="${v3 != -1}">
                    <p>Votre lancé de Dé 3 est <c:out value="${v3}" /></p>
                </c:if>

                <c:forEach var="message" items="${requestScope.messages}">
                    <p><c:out value="${message}" /></p>
                </c:forEach>

                <c:set var="gameState" value="${sessionScope.gameState}" />
                <c:set var="user" value="${gameState.user}" />

                <span> | Votre score : <c:out value="${user.score}" />  || </span>
                <span> Meilleur Score : <c:out value="${user.bestScore}" /> |</span>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col">
            	<form method="POST" action="${pageContext.request.contextPath}/EndGameServlet">
            	 <button type="submit" class="btn btn-primary">Revenir au jeu</button>
            	</form>
             </div>
        </div>
    </div>
</body>
</html>
