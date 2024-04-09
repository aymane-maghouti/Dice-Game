<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.bo.GameState"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mon meilleur Score</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Mon meilleur Score</h1>
        <c:choose>
            <c:when test="${sessionScope.gameState.user.bestScore > sessionScope.gameState.user.score}">
                <p class="text-success">${sessionScope.gameState.user.bestScore}</p>
            </c:when>
            <c:otherwise>
                <p class="text-primary">${sessionScope.gameState.user.score}</p>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Bootstrap JS bundle (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>