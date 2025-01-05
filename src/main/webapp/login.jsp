<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        /* Basic reset */
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
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            font-family: Arial, sans-serif;
        }

        /* Form Container */
        .login-container {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 1.5s ease;
            width: 300px;
            color: black;
        }

        /* Headings */
        h2 {
            color: #333;
            margin-bottom: 1rem;
            font-size: 24px;
        }

        /* Label and Input Row */
        .form-row {
            display: flex;
            align-items: center;
            margin-top: 1rem;
        }

        label {
            font-size: 16px;
            color: #666;
            width: 30%;
            text-align: right;
            margin-right: 1rem;
        }

        input[type="text"],
        input[type="password"] {
            width: 65%;
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #6e8efb;
            outline: none;
        }

        /* Submit Button */
        input[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            margin-top: 1.5rem;
            background: #6e8efb;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background: #5a75e5;
        }

        /* Animation */
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
    <div class="login-container">
        <h2>Login</h2>
        <form action="login">
            <div class="form-row">
                <label for="username">Username:</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-row">
                <label for="password">Password:</label>
                <input type="password" name="password" required>
            </div>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
