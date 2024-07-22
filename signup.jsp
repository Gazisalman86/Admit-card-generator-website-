<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            background-image: url('https://images.shiksha.com/mediadata/images/1677147458phpNOAJhO.jpeg');
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.8); 
            padding: 20px;
            border-radius: 10px;
            margin: auto; 
            width: 50%; 
            max-width: 400px; 
            text-align: center;
        }

        h1 {
            color: black; 
            text-align: center;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%; 
            padding: 10px; 
            margin-bottom: 15px; 
            border: 1px solid #ccc; 
            border-radius: 5px; 
            box-sizing: border-box; 
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff; 
            color: white; 
            border: none; 
            border-radius: 5px;
            cursor: pointer; 
            transition: background-color 0.3s ease; 
        }

        input[type="submit"]:hover {
            background-color: #0056b3; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Sign Up</h1>
        <form action="signin.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
           
            <input type="submit" value="Sign Up">
        </form>
    </div>
    <% 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String dbUrl = "jdbc:mysql://localhost:8080/student_database";
        String dbUsername = "username";
        String dbPassword = "password";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_database","username","password");
            String query = "INSERT INTO users (username, password) VALUES (username , password)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("signin.jsp");
            } else {
                out.println("<h3>Failed to sign up</h3>");
            }
            connection.close();
        } catch (Exception e) {
            out.println("" + e.getMessage());
        }
    %>
</body>
</html>
