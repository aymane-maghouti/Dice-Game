package com.web.helpers;

import java.util.List;

import com.bo.Utilisateur;


public interface IGameDataManagement {

	public List<Utilisateur> getAllUsers();

	public void updateBestScore(Utilisateur user);

	public void insertUser(Utilisateur user);

	public Utilisateur getUserByLogin(String login);
}
