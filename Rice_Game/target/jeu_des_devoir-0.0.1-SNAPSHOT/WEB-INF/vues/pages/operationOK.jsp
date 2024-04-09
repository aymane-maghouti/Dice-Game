<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>App Game</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }
    .container {
        max-width: 600px;
        margin: 50px auto;
    }
    .success-heading {
        color: #28a745;
        margin-bottom: 20px;
    }
    .success-message {
        color: #28a745;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1 class="success-heading">Opération effectuée</h1>
        <ul class="list-unstyled">
            <c:forEach items="${requestScope.messages}" var="msg">
                <li class="success-message">${msg.text}</li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>