package com.web.servlets;

import java.io.IOException;
import java.util.List;



import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.bo.Utilisateur;
import com.web.helpers.DataManagementFactory;
import com.web.helpers.GameContextManagement;
import com.web.helpers.IGameDataManagement;


public class BestScoreServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		IGameDataManagement contextGame = (IGameDataManagement) getServletContext().getAttribute("gameData");

		// On récupére tous les utilisateurs
		List<Utilisateur> users = contextGame.getAllUsers();


		// On stocke dans la requete (comme attribut) les utilisateurs. Cette
		// liste a une durée de vie = à la durée de vie de la requete. Donc elle
		// n'existera plus à la fin du cycle de vie de la requete
		request.setAttribute("users", users);

		// On redirige vers la vue (redirection coté serveur)
		getServletContext().getRequestDispatcher("/WEB-INF/vues/back/bestScore.jsp").forward(request, response);

	}

}
