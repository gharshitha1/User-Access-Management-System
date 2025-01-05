package com.management.web.dao;

import java.sql.*;

import com.management.web.model.User;

public class LoginDao {
    public User validateUser(String username, String password) {
        User a = new User();
        
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMS", "postgres", "12345");
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a.setRole(rs.getString("role"));
            }
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        
        return a;
    }
}
