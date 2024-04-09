<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.bo.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.bo.GameState"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
	
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>App Game</title>

<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">


<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/style/signin.css" rel="stylesheet">

</head>

<style>
body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 800px;
        margin: 50px auto;
    }
    .row {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .form-container {
        flex: 1;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        padding: 40px;
        text-align: center;
    }
    h2 {
        margin-top: 0;
        color: #333;
    }
    label {
        display: block;
        margin-bottom: 10px;
        color: #666;
        text-align: left;
    }
    input[type="text"],
    input[type="password"] {
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 100%;
        box-sizing: border-box;
    }
    button {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    button:hover {
        background-color: #0056b3;
    }
    a {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
        margin-bottom: 20px;
        display: inline-block;
    }
    ul {
        list-style: none;
        padding: 0;
        margin-top: 20px;
    }
    li {
        margin-bottom: 5px;
        color: #333;
    }
    .warn {
        color: #ffc107;
    }
    .info {
        color: #28a745;
    }
    .error {
        color: #dc3545;
    }
    .app-name {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
    }

</style>


<body>

<div class="container">

    <div class="form-container">
    	<div class="app-name">Jeu de Des</div> 
    	<hr>
        <form method="POST" action="${pageContext.request.contextPath}/LoginServlet">
            <h2>Connexion</h2>
            <div class="form-group">
                <label for="inputEmail">Nom d'utilisateur</label>
                <input type="text" class="form-control" id="inputEmail" placeholder="Nom d'utilisateur" required autofocus name="login">
            </div>
            <div class="form-group">
                <label for="inputPassword">Mot de passe</label>
                <input type="password" class="form-control" id="inputPassword" placeholder="Mot de passe" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-signin">Connexion</button>
            <p>Vous n'avez pas encore de compte ? <a href="${pageContext.request.contextPath}/UserManagementServlet?create"> S'inscrire</a><p>
        </form>
        
        <div>
                <ul>
                    <c:forEach items="${requestScope.messages}" var="msg">
                        <c:choose>
                            <c:when test="${msg.type == Message.WARN}">
                                <li class="warn">${msg.text}</li>
                            </c:when>
                            <c:when test="${msg.type == Message.INFO}">
                                <li class="info">${msg.text}</li>
                            </c:when>
                            <c:when test="${msg.type == Message.ERROR}">
                                <li class="error">${msg.text}</li>
                            </c:when>
                            <c:otherwise>
                                <li>${msg.text}</li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
    </div>
   
</div>



</body>

</html>
