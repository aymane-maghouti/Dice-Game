package com.web.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;



public class GameRulesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		
		request.getRequestDispatcher("/WEB-INF/vues/back/GameRules.jsp").forward(request, response);
		return;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		toHome(request, response);
	}
	
	protected void toHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);
		return;
	}

}
