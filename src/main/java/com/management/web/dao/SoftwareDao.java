package com.management.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.management.web.model.Software;

public class SoftwareDao {
	public void addSoftware(Software software) {
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMS", "postgres", "12345");
            String query = "INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, software.getName());
            pst.setString(2, software.getDescription());
            String[] accessLevelsArray = software.getAccessLevels().split(",");
            pst.setArray(3, con.createArrayOf("text", accessLevelsArray));
            
            // Execute the insert
            pst.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
