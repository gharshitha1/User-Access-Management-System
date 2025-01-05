<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Software</title>
    <style>
        /* Reset */
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
            background: linear-gradient(135deg, #FAD961, #F76B1C);
            font-family: Arial, sans-serif;
        }

        /* Form Container */
        .form-container {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
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

        input[type="text"], textarea {
            width: 90%;
            padding: 0.5rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus, textarea:focus {
            border-color: #FAD961;
            box-shadow: 0 0 5px rgba(250, 217, 97, 0.5);
            outline: none;
        }

        /* Checkbox Styling */
        .checkbox-container {
            display: flex;
            gap: 10px;
            margin-bottom: 1rem;
        }

        /* Submit Button */
        input[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            background: #F76B1C;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background: #e65c00;
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
        <h2>Create Software</h2>
        <form action="software" method="post">
            <label for="softwareName">Software Name:</label>
            <input type="text" name="name" required>
            
            <label for="description">Description:</label>
            <textarea name="description" required></textarea>
            
            <label for="accessLevels">Access Levels:</label>
            <div class="checkbox-container">
                <input type="checkbox" name="accessLevels" value="Read"> Read
                <input type="checkbox" name="accessLevels" value="Write"> Write
                <input type="checkbox" name="accessLevels" value="Admin"> Admin
            </div>
            
            <input type="submit" value="Create Software">
        </form>
    </div>
</body>
</html>
