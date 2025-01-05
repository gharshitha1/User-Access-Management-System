<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard</title>
    <style>
        /* Basic reset for consistent styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #6dd5fa, #2980b9);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Container for the Content */
        .container {
            background: #2c3e50;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 600px;
            text-align: center;
        }

        /* Heading */
        h1 {
            color: #ecf0f1;
            margin-bottom: 1.5rem;
            font-size: 36px;
        }

        /* List Styling */
        ul {
            list-style-type: none;
        }

        ul li {
            margin-bottom: 1rem;
        }

        /* Links Styling */
        a {
            text-decoration: none;
            color: #3498db;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            background-color: #34495e;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, Admin!</h1>
        <ul>
            <li><a href="createSoftware.jsp">Create Software</a></li>
            <li><a href="pendingRequests.jsp">Pending Requests</a></li>
            <li><a href="requestAccess.jsp">Request Access</a></li>
        </ul>
    </div>
</body>
</html>
