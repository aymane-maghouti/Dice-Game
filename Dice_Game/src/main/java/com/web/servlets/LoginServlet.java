package com.web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.bo.GameState;
import com.bo.Message;
import com.bo.Utilisateur;
import com.web.helpers.GameContextManagement;
import com.web.helpers.IGameDataManagement;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// On récupére les données envoyées dans le formulaire
		String login = request.getParameter("login");
		String password = request.getParameter("password");

		// On instancie la liste que nous utiliserons pour stocker les messages
		// à passer à la vue
		List<Message> messages = new ArrayList<Message>();

		IGameDataManagement gameContext = (IGameDataManagement) getServletContext().getAttribute("gameData");

		// On recherche l'utilisateur par login
		Utilisateur user = gameContext.getUserByLogin(login.trim());
		// Si un utilisateur existe
		if (user != null) {

			// On vérifie que les mots de passe sont identiques
			if (user.getPassword() != null && user.getPassword().equals(password)) {

				// On stocke l'objet stockant l'état de jeu dans la session
				GameState gameSate = new GameState(user);
				request.getSession().setAttribute("gameState", gameSate);

				// On stocke l'utilisateur authentifié dans la session
				request.getSession().setAttribute("user", user);

				// On envoie une vue qu'est la page home comme résultat
				getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);

				// Fin
				return;
			} else {

				// On ajoute un message
				messages.add(new Message("Login ou mot de passe incorrect", Message.WARN));

				// Mettre la la liste des messages dans les attributs de la requête
				request.setAttribute("messages", messages);

				// on affiche le formulaire d'authentification avec des
				// messages d'erreur
				getServletContext().getRequestDispatcher("/WEB-INF/vues/pages/loginForm.jsp").forward(request, response);

				return;
			}

		} else {
			messages.add(new Message("Login ou mot de passe incorrect", Message.WARN));

			request.setAttribute("messages", messages);

			// de meme si l'utilisateur est introuvable avec une recherche par
			// login
			getServletContext().getRequestDispatcher("/WEB-INF/vues/pages/loginForm.jsp").forward(request, response);

			// Fin
			return;
		}
	}

}
