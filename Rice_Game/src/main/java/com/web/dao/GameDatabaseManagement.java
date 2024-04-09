package com.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bo.Utilisateur;
import com.web.helpers.GameException;
import com.web.helpers.IGameDataManagement;



public class GameDatabaseManagement implements IGameDataManagement {

    private static GameDatabaseManagement instance;

    private String connectionString = "jdbc:mysql://localhost:3306/gamedb?user=root&password=aymane2002";

    public GameDatabaseManagement() throws GameException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            throw new GameException(e);
        }
    }

    public List<Utilisateur> getAllUsers() throws GameException {
        Connection con = null;
        List<Utilisateur> list = new ArrayList<Utilisateur>();

        try {
            con = DriverManager.getConnection(connectionString);

            try {
                Statement st = con.createStatement();

                ResultSet rs = st.executeQuery("select * from Utilisateur");

                while (rs.next()) {
                    Utilisateur u = new Utilisateur(rs.getString("nom"), rs.getString("prenom"),
                            rs.getString("login"), rs.getString("password"), rs.getDouble("score"),
                            rs.getDouble("bestScore"), 0);
                    list.add(u);
                }
            } finally {
                if (con != null) {
                    con.close();
                }
            }
        } catch (SQLException e) {
            throw new GameException(e);
        }
        return list;
    }

    public void updateBestScore(Utilisateur user) throws GameException {
        Connection con = null;
        try {
            con = DriverManager.getConnection(connectionString);

            try {
                PreparedStatement pstmt = con.prepareStatement("UPDATE Utilisateur set bestScore = ? where login=?");
                pstmt.setDouble(1, user.getBestScore());
                pstmt.setString(2, user.getLogin());
                pstmt.executeUpdate();
            } finally {
                if (con != null) {
                    con.close();
                }
            }
        } catch (SQLException e) {
            throw new GameException(e);
        }
    }

    public void insertUser(Utilisateur user) throws GameException {
        Connection con = null;
        try {
            con = DriverManager.getConnection(connectionString);

            try {
                PreparedStatement pstmt = con.prepareStatement(
                        "insert into Utilisateur ( nom,  prenom,  login,  password,  score,  bestScore) values ( ?,  ?,  ?,  ?,  ?,  ?)");
                pstmt.setString(1, user.getNom());
                pstmt.setString(2, user.getPrenom());
                pstmt.setString(3, user.getLogin());
                pstmt.setString(4, user.getPassword());
                pstmt.setDouble(5, user.getScore());
                pstmt.setDouble(6, user.getBestScore());
                pstmt.executeUpdate();
            } finally {
                if (con != null) {
                    con.close();
                }
            }
        } catch (SQLException e) {
            throw new GameException(e);
        }
    }

    public Utilisateur getUserByLogin(String login) throws GameException {
        Connection con = null;
        List<Utilisateur> list = new ArrayList<Utilisateur>();

        try {
            con = DriverManager.getConnection(connectionString);

            try {
                PreparedStatement pstmt = con.prepareStatement("select * from Utilisateur where login =?");
                pstmt.setString(1, login);
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    Utilisateur u = new Utilisateur(rs.getString("nom"), rs.getString("prenom"),
                            rs.getString("login"), rs.getString("password"), rs.getDouble("score"),
                            rs.getDouble("bestScore"), 0);
                    list.add(u);
                }
            } finally {
                if (con != null) {
                    con.close();
                }
            }
        } catch (SQLException e) {
            throw new GameException(e);
        }
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }
}
