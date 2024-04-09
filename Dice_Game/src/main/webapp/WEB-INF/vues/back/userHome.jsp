<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.bo.Message"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">


<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        padding-top: 50px; /* For the fixed navbar */
    }
    .container {
        max-width: 800px;
        margin: 0 auto;
    }
    
    .navbar-text {
        color: white; /* Couleur du texte */
        font-size:25px;
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
    
    li {
        margin-bottom: 5px;
        color: #333;
    }
       #message {
        list-style: none;
        padding: 0;
        margin-top: 20px;
    }
    
    .requis {
        color: red;
    }
    
    
    
	.input-container {
	  margin-bottom: 20px;
	}
	
	.input-container label {
	  display: block;
	  margin-bottom: 5px;
	  color: #333;
	  font-weight: bold;
	}
	
	.input-container .requis {
	  color: red;
	}

	.input-container input[type="text"] {
	  padding: 5px;
	  border: 2px solid #ccc;
	  border-radius: 5px;
	  font-size: 16px;
	  outline: none;
	  transition: border-color 0.3s;
	  width: 35%;
	}

	.input-container input[type="text"]:focus {
	  border-color: dodgerblue;
	}

	.input-container input[type="text"]::placeholder {
	  color: #aaa;
	}
</style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <span class="navbar-text">Bonjour <c:out value="${sessionScope.gameState.user.login}" /></span>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/back/bestScore">Meilleurs scores</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/back/ReinitGameServlet">Réinitialiser le jeu</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/back/myBestScore">Mon meilleur Score</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/DeconnectServlet">Se déconnecter</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/back/gameRulesservlet">Régle du jeu</a>
            </li>
        </ul>
    </div>
</nav>


    <!-- Main content -->
    <div class="container">
        <h1 class="mt-5">Jeu de dés</h1>
        
        <p>Entrez le numéro du dé à lancer, puis cliquez sur le bouton</p>
        
        
        <form class="mt-4" action="${pageContext.request.contextPath}/back/GameServlet">
        	  <div class="input-container">
				  <label for="numDe">Numero du dé <span class="requis">*</span>
				  <input type="text" id="numDe" name="numDe" placeholder="1 ou 2 ou 3" required>
				  </label>  
				  
			</div>
        	<div>
                <ul id="message">
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
            <input type="submit" value="Lancer le dé" class="btn btn-primary">
        </form>

        
        
          
        
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>