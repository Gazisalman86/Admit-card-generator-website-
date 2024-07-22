<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
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
        input[type="password"] {
            width: 50%; 
            padding: 10px; 
            margin-bottom: 15px; 
            border: 1px solid #ccc; 
            border-radius: 10px; 
            box-sizing: border-box; 
        }

        input[type="submit"] {
            width: 20%;
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
        <h1>Sign In</h1>
        <form action="index.html" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Sign In">
        </form>
    </div>
    <% 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String Url = "jdbc:mysql://localhost:8080/my_database";
        String dbUsername = "your_username";
        String dbPassword = "your_password";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(Url, dbUsername, dbPassword);
            String query = "SELECT * FROM users WHERE username=username AND password=password";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                response.sendRedirect("welcome.html");
            } else {
                out.println("<h3>Invalid username or password</h3>");
            }
            connection.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>
</body>
</html>
