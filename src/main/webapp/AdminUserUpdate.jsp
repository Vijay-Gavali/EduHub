<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html>
<head>
<title>Update User</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<h2>Update User</h2>

	<%
	Map<String, Object> user = (Map<String, Object>) request.getAttribute("user");
	if (user != null) {
	%>

	<form action="AdminUpdateUserController" method="post">
		<input type="hidden" name="user_id" value="<%=user.get("user_id")%>">
		Name: <input type="text" name="name" value="<%=user.get("name")%>"
			required><br>
		<br> Email: <input type="email" name="email"
			value="<%=user.get("email")%>" required><br>
		<br> Contact No: <input type="text" name="contact_no"
			value="<%=user.get("contact_no")%>" required><br>
		<br> Role: <select name="role" required>
			<option value="Teacher"
				<%="Teacher".equals(user.get("role")) ? "selected" : ""%>>Teacher</option>
			<option value="Parent"
				<%="Parent".equals(user.get("role")) ? "selected" : ""%>>Parent</option>
		</select><br>
		<br> Age: <input type="number" name="age"
			value="<%=user.get("age")%>" required><br>
		<br> Grade: <input type="text" name="grade"
			value="<%=user.get("grade")%>" required><br>
		<br> Class ID: <input type="number" name="class_id"
			value="<%=user.get("class_id")%>" required><br>
		<br> <input type="submit" value="Update User">
	</form>

	<%
	} else {
	%>
	<p>User details not available.</p>
	<%
	}
	%>

</body>
</html>
