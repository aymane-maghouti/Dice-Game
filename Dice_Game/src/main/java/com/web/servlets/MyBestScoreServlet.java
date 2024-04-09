package com.web.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.bo.Utilisateur;
import com.web.helpers.DataManagementFactory;
import com.web.helpers.GameContextManagement;
import com.web.helpers.IGameDataManagement;



public class MyBestScoreServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {



        request.getRequestDispatcher("/WEB-INF/vues/back/myBestScore.jsp").forward(request, response);

	}

}
