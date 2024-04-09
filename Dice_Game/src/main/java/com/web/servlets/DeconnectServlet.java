package com.web.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class DeconnectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeconnectServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Invalider la session
		request.getSession().invalidate();

		// On redirige vers login
		getServletContext().getRequestDispatcher("/WEB-INF/vues/pages/loginForm.jsp").forward(request, response);

		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
