package com.management.web.dao;

import java.sql.*;

import com.management.web.model.User;


public class UserDao {
    public int addUser(User user) {
    	int userId=-1;
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMS", "postgres", "12345");
            String query = "INSERT INTO users (username, password, role) VALUES (?, ?, ?) RETURNING id";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getRole());
            
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("id");
                user.setId(userId);             }
    
        } catch (Exception e) {
            System.out.println(e);
        }
        return userId;
    }

	public int getUserIdByUsername(String username) {
		int userId=-1;
		try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMS", "postgres", "12345");
            String query = "SELECT * FROM users WHERE username = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userId=rs.getInt("id");
            }
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return userId;
	}
}

