<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Règles du jeu</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

  <div class="container mt-5">
    <h1 class="mb-4">Règles du jeu</h1>
    
    <p>Dans ce jeu, chaque joueur dispose de trois dés numérotés de 1 à 3. Ils sont invités à les lancer séquentiellement dans l'ordre de leur choix via une interface graphique simple. Le déroulement du jeu est conditionné par quelques règles clés : tout d'abord, aucun dé ne peut être lancé plus d'une fois pendant la partie. 
    <p>Si un joueur tente de relancer un dé déjà utilisé, la partie prend fin immédiatement et le score est fixé à -1.</p> 
	<p>Ensuite, le score final dépend des résultats obtenus pour les trois dés : si le résultat du premier dé est inférieur à celui du deuxième, et que ce dernier est inférieur au troisième, le joueur obtient un score égal à la somme des résultats des trois dés.</p>     
	<p>Sinon, le score est nul. La partie se termine dès qu'il est possible de déterminer le score final, par exemple si le premier dé affiche un 6, indiquant que les autres résultats n'auront aucun impact sur le score. De plus, la partie peut se terminer si un même dé est lancé deux fois ou si la condition de progression ascendante des résultats n'est pas respectée.</p></p>   
  	
  	<form method="POST" action="${pageContext.request.contextPath}/back/gameRulesservlet">
     <button type="submit" class="btn btn-primary">Jouer</button>
	</form>
  </div>


</body>
</html>