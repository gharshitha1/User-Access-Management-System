<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.management.web.model.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Access</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #8EC5FC, #E0C3FC);
            font-family: Arial, sans-serif;
        }

        /* Form Container */
        .form-container {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 350px;
            animation: fadeIn 1.2s ease;
        }

        /* Heading */
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 24px;
        }

        /* Form Labels and Inputs */
        label {
            font-size: 16px;
            color: #666;
            margin-bottom: 0.5rem;
            display: inline-block;
        }

        select, textarea, input[type="text"] {
            width: 90%;
            padding: 0.5rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        select:focus, textarea:focus, input[type="text"]:focus {
            border-color: #8EC5FC;
            box-shadow: 0 0 5px rgba(142, 197, 252, 0.5);
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 70px;
        }

        /* Submit Button */
        input[type="submit"] {
            width: 90%;
            padding: 0.5rem;
            background: #8EC5FC;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background: #79B3FF;
        }

        /* Fade-in Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Request Access to Software</h2>
        <form action="request" method="post">
            <label for="softwareName">Software Name:</label>
            <select name="softwareId" required>
                <option value="">Select Software</option>
                <%
                    Connection con = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("org.postgresql.Driver");
                        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMS", "postgres", "12345");
                        String query = "SELECT id, name FROM software";
                        pst = con.prepareStatement(query);
                        rs = pst.executeQuery();

                        while (rs.next()) {
                            int softwareId = rs.getInt("id");
                            String softwareName = rs.getString("name");
                            out.println("<option value='" + softwareId + "'>" + softwareName + "</option>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (pst != null) try { pst.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </select><br><br>

            <label for="accessType">Access Type:</label>
            <select name="accessType" required>
                <option value="Read">Read</option>
                <option value="Write">Write</option>
                <option value="Admin">Admin</option>
            </select><br><br>

            <label for="reason">Reason for Request:</label><br>
            <textarea name="reason" rows="4" cols="50" required></textarea><br><br>
            <input type="submit" value="Request Access">
        </form>

        <% if (request.getParameter("success") != null) { %>
            <p style="color: green;">Request submitted successfully!</p>
        <% } %>
    </div>
</body>
</html>
