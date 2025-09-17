<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="LoginController" method="post">
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required />
            </div>

            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required />
            </div>
<!--
            <div class="form-group">
                <label>Login As:</label>
                <select name="role" required>
                    <option value="">Select Role</option>
                    <option value="Admin">Admin</option>
                    <option value="Parent">Parent</option>
                    <option value="Teacher">Teacher</option>
                </select>
            </div>
-->
            <div class="form-group">
                <input type="submit" value="Login" />
            </div>
        </form>
    </div>
</body>
</html>
