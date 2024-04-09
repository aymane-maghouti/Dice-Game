<%@page import="com.bo.Utilisateur"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/style/bootstrap.min.css"
	rel="stylesheet">

<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Meilleurs scores</title>
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
        <h1>Meilleurs scores</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Score</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.users}" var="user">
                    <tr>
                        <td>${user.nom}</td>
                        <td>${user.prenom}</td>
                        <td>${user.bestScore}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS bundle (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>