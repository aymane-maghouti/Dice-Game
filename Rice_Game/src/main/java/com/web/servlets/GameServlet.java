package com.web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.bo.GameState;
import com.bo.Message;
import com.bo.TripleDe;
import com.bo.Utilisateur;
import com.web.helpers.GameContextManagement;
import com.web.helpers.IGameDataManagement;

/**
 * Implémente les régles du jeu
 * 
 * @author Aymane Maghouti & Ossama outmani
 */
public class GameServlet extends HttpServlet {

	public GameServlet() {
	}


	protected void play(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Utilisateur user = (Utilisateur) session.getAttribute("user");
		IGameDataManagement gameContext = (IGameDataManagement) getServletContext().getAttribute("gameData");		
		GameState gameState = (GameState) session.getAttribute("gameState");
		
		List<Message> messages = new ArrayList<Message>();

		int numde;
		
		try {
			numde =Integer.parseInt(request.getParameter("numDe"));

		} catch (NumberFormatException e) {
			messages.add(new Message("Veuillez choisir un nombre !",Message.ERROR));
			request.setAttribute("messages", messages);
			getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);
			return;
		}
		
			
		if (numde != 1 && numde != 2 && numde != 3  ) {
			messages.add(new Message("Nombre de Dé invalide !",Message.WARN));
			
			request.setAttribute("messages", messages);
			getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);
			return;
		}
		
		TripleDe tripleDe = gameState.getDes();
		
		int valueD1=tripleDe.getD1();
		int valueD2=tripleDe.getD2();
		int valueD3=tripleDe.getD3();

		
		
		if((numde == 1 && valueD1 != -1) || (numde == 2 && valueD2 != -1) || (numde == 3 && valueD3 != -1) ) {			
				user.setScore(-1);
				messages.add(new Message("Jeu terminé ",Message.WARN));
				request.setAttribute("messages", messages);
				endGame(request, response);
				return;
			}
		
				
		if(numde ==1 ) {
			tripleDe.generateD1();		
			if(tripleDe.getD1()==6 || tripleDe.getD1()==5 || tripleDe.getD1() == valueD2 || tripleDe.getD1() == valueD3 
					|| (tripleDe.getD2()!=-1 && tripleDe.getD2() < tripleDe.getD1())
					|| (tripleDe.getD3()!=-1 && tripleDe.getD3() < tripleDe.getD1())) {
				messages.add(new Message("Jeu terminé ",Message.WARN));
				
				request.setAttribute("messages", messages);
				endGame(request, response);
				return;
			}
			
		}
		
		if (numde == 2) {
			tripleDe.generateD2();
			if(tripleDe.getD2()==6 || tripleDe.getD2()==1 || tripleDe.getD2() == valueD1 || tripleDe.getD2() == valueD3
					|| (tripleDe.getD1()!=-1 && tripleDe.getD1() > tripleDe.getD2())
					|| (tripleDe.getD3()!=-1 && tripleDe.getD3() < tripleDe.getD2())) {
				messages.add(new Message("Jeu terminé ",Message.WARN));
				
				request.setAttribute("messages", messages);

				endGame(request, response);
				return;
			}
		}
		
		if (numde == 3) {
			tripleDe.generateD3();
			if(tripleDe.getD3()==1 || tripleDe.getD3()==2 || tripleDe.getD3() == valueD2 || tripleDe.getD3() == valueD1 
					|| (tripleDe.getD2()!=-1 && tripleDe.getD2() > tripleDe.getD3())
					|| (tripleDe.getD1()!=-1 && tripleDe.getD1() > tripleDe.getD3())) {
				messages.add(new Message("Jeu terminé !",Message.WARN));
				
				request.setAttribute("messages", messages);

				endGame(request, response);
				return;
			}
			
		}
		
	
		user.incrementLance();

		
		if(user.getCompteurLancer()==3) {
			
			if((tripleDe.getD1()<tripleDe.getD2()) && (tripleDe.getD2()<tripleDe.getD3())){
				int res = tripleDe.getD1()+tripleDe.getD2()+tripleDe.getD3();
				user.setScore(res);
				if (user.getScore() > user.getBestScore()) {
					user.setBestScore(user.getScore());
					gameContext.updateBestScore(user);
				}
				messages.add(new Message("vous avez gagné !",Message.INFO));
				request.setAttribute("messages", messages);

				endGame(request, response);
				return;
			}else {
				user.setScore(0);
				messages.add(new Message("Jeu terminé ",Message.INFO));
				request.setAttribute("messages", messages);

				endGame(request, response);
				return;
			}
		}
		else {
			if(numde==1) {
				messages.add(new Message("Vous obtenez "+tripleDe.getD1()+" pour Dé Numero 1",Message.INFO));
				request.setAttribute("messages", messages);

				getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);
				
				return;
			}
			if(numde==2) {
				messages.add(new Message("Vous obtenez "+tripleDe.getD2()+" pour Dé Numero 2",Message.INFO));
				request.setAttribute("messages", messages);

				getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);
				
				return;
			}
			if(numde==3) {
				messages.add(new Message("Vous obtenez "+tripleDe.getD3()+" pour Dé Numero 3",Message.INFO));
				request.setAttribute("messages", messages);

				getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);
				
				return;
			}
			
		}
		
	}
		
	
	protected void endGame(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		Utilisateur user = (Utilisateur) session.getAttribute("user");
		
		GameState gameState = (GameState) session.getAttribute("gameState");
		TripleDe tripleDe = gameState.getDes();
		
		int valueD1=tripleDe.getD1();
		int valueD2=tripleDe.getD2();
		int valueD3=tripleDe.getD3();

		request.setAttribute("ValueD1",valueD1);
		request.setAttribute("ValueD2",valueD2);
		request.setAttribute("ValueD3",valueD3);
		
		getServletContext().getRequestDispatcher("/WEB-INF/vues/back/endGame.jsp").forward(request, response);

		gameState.reinit();
		
		return;
	}	
		
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		play(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		play(request, response);

	}

}
