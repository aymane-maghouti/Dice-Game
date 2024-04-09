<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>App Game</title>

<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">


<!-- Custom styles for this template -->

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }
    .container {
        max-width: 400px;
        margin: 0 auto;
        padding: 40px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }
    legend {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #007bff;
    }
    label {
        color: #333;
    }
    input[type="text"],
    input[type="password"] {
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: calc(100% - 22px);
        box-sizing: border-box;
    }
    .btn-primary {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        width: 100%;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
    .requis {
        color: red;
    }
</style>
</head>
<body>
    <div class="container">
        <form method="post" action="${pageContext.request.contextPath}/UserManagementServlet">
            <fieldset>
                <legend>Inscription</legend>
                <p class="lead">Entrez vos informations pour vous inscrire sur le site</p>

                <div class="form-group">
                    <label for="nom">Nom<span class="requis">*</span></label>
                    <input type="text" id="nom" name="nom" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="prenom">Prénom<span class="requis">*</span></label>
                    <input type="text" id="prenom" name="prenom" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="motdepasse">Mot de passe<span class="requis">*</span></label>
                    <input type="password" id="motdepasse" name="password" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="username">Nom d'utilisateur</label>
                    <input type="text" id="username" name="login" class="form-control">
                </div>

                <button type="submit" class="btn btn-primary">Inscription</button>
            </fieldset>
        </form>
    </div>
</body>
</html>