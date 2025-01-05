package com.management.web.dao;
import java.sql.*;
public class ApprovalDao {
	public void updateRequestStatus(int requestId, String status) {
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMS", "postgres", "12345");
            String query = "UPDATE requests SET status = ? WHERE id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, status);
            pst.setInt(2, requestId);
            pst.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}

