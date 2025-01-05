package com.management.web.dao;

import java.sql.*;

import com.management.web.model.Request;


public class RequestDao {
	public void addRequest(Request request) {
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMS", "postgres", "12345");
            String query = "INSERT INTO requests (user_id,software_id, access_type, reason) VALUES (?,?,?,?);";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, request.getUserId());
            pst.setInt(2, request.getSoftwareId());
            pst.setString(3, request.getAccessType());
            pst.setString(4, request.getReason());
            // Execute the insert
            pst.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
