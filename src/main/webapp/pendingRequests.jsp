<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pending Requests</title>
    <style>
        /* Basic Reset */
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
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            font-family: Arial, sans-serif;
        }

        /* Container for the Content */
        .container {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 800px;
        }

        /* Heading */
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 24px;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        th, td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }

        th {
            background-color: #ff9a9e;
            color: #fff;
        }

        td {
            color: #666;
        }

        /* Action Buttons */
        .action-buttons .approve-btn {
            background-color: #4CAF50;
            color: #fff;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 0.5rem;
            transition: background-color 0.3s;
        }

        .action-buttons .reject-btn {
            background-color: #f44336;
            color: #fff;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .approve-btn:hover {
            background-color: #45a049;
        }

        .reject-btn:hover {
            background-color: #e53935;
        }

        /* Media Queries */
        @media (max-width: 600px) {
            th, td {
                font-size: 14px;
                padding: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Pending Access Requests</h2>
        <form action="approval" method="post">
            <table>
                <tr>
                    <th>Select</th>
                    <th>Request ID</th>
                    <th>Employee Name</th>
                    <th>Software Name</th>
                    <th>Access Type</th>
                    <th>Reason for Request</th>
                </tr>
                <%
                    Connection con = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("org.postgresql.Driver");
                        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMS", "postgres", "12345");

                        // SQL query to fetch pending requests
                        String query = 
                            "SELECT " +
                            "    requests.id, " +
                            "    users.username, " +
                            "    software.name AS software_name, " +
                            "    requests.access_type AS access_type, " +
                            "    requests.reason AS reason, " +
                            "    requests.status " +
                            "FROM " +
                            "    requests " +
                            "INNER JOIN " +
                            "    users ON requests.user_id = users.id " +
                            "INNER JOIN " +
                            "    software ON requests.software_id = software.id " +
                            "WHERE " +
                            "    requests.status = 'Pending'";

                        pst = con.prepareStatement(query);
                        rs = pst.executeQuery();
                        while (rs.next()) {
                            int requestId = rs.getInt("id");
                            String username = rs.getString("username");
                            String softwareName = rs.getString("software_name");
                            String accessType = rs.getString("access_type");
                            String reason = rs.getString("reason");

                            out.println("<tr>");
                            out.println("<td><input type='checkbox' name='selectedRequests' value='" + requestId + "'></td>");
                            out.println("<td>" + requestId + "</td>");
                            out.println("<td>" + username + "</td>");
                            out.println("<td>" + softwareName + "</td>");
                            out.println("<td>" + accessType + "</td>");
                            out.println("<td>" + reason + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<tr><td colspan='6' style='text-align: center; color: red;'>Error fetching data</td></tr>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (pst != null) try { pst.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </table>

            <div class="checkbox-container">
                <button type="submit" name="action" value="approve">Approve Selected</button>
                <button type="submit" name="action" value="reject">Reject Selected</button>
            </div>
        </form>
    </div>
</body>
</html>
