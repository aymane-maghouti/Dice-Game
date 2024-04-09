package com.web.helpers;

import com.web.dao.GameDatabaseManagement;

import jakarta.servlet.ServletContext;

public class DataManagementFactory {

	public static IGameDataManagement getInstance(String pType, ServletContext context) throws GameException {

		if (!"mysql".equals(pType)) {
			return new GameContextManagement(context);
		}

		return new GameDatabaseManagement();

	}

}
