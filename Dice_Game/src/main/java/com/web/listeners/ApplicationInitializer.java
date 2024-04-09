package com.web.listeners;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;

import com.bo.Utilisateur;
import com.web.helpers.DataManagementFactory;
import com.web.helpers.IGameDataManagement;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ApplicationInitializer
 *
 */
@WebListener
public class ApplicationInitializer implements ServletContextListener {
	
	private Logger logger = Logger.getLogger(ApplicationInitializer.class);

	/**
	 * Default constructor.
	 */
	public ApplicationInitializer() {
		logger.debug("ApplicationInitializer est crée");
		
	}

	public void contextInitialized(ServletContextEvent sce) {
		
		//On obtient une référence sur l'unique objet de type ServletContext
		ServletContext ctx = sce.getServletContext();

		//On récupère la valeur du paramètre du context nommé type_stockage
		String type = ctx.getInitParameter("type_stockage");

		//
		IGameDataManagement gameData = DataManagementFactory.getInstance(type, ctx);

		ctx.setAttribute("gameData", gameData);

		List<Utilisateur> userList = Collections.synchronizedList(new ArrayList<Utilisateur>());

		ctx.setAttribute("users", userList);
		
		logger.debug("Fin de l'initialisation du context");


	}

}
