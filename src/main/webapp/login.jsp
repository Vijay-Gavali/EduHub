<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <!-- Link external CSS -->
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>

        <% 
           String err = (String) request.getAttribute("errorMessage");
           if (err != null) { %>
            <div class="error"><%= err %></div>
        <% } %>

        <form action="LoginController" method="post">
            <div class="form-group">
                <label>Phone Number:</label>
                <input type="text" name="phone" placeholder="Enter phone number" required />
            </div>

            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" placeholder="Enter password" required />
            </div>

            <div class="form-group">
                <input type="submit" value="Login" />
            </div>
        </form>
    </div>
</body>
</html>
