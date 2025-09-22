<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Parent Registration</title>
    <link rel="stylesheet" type="text/css" href="css/ParentRegistration.css">
</head>
<body>
    <div class="form-container">
        <h2>Parent Registration</h2>
        <form action="ParentRegistration" method="post">
            <div class="form-group">
                <label>Parent Name:</label>
                <input type="text" name="parent_name" required />
            </div>
            <div class="form-group">
                <label>Phone:</label>
                <input type="text" name="phone" required />
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required />
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required />
            </div>
            <div class="form-group">
                <input type="submit" value="Register" />
            </div>
        </form>
    </div>
</body>
</html>
