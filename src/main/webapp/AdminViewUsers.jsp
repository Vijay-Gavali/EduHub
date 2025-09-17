
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>

<!DOCTYPE html>
<html>
<head>
<title>All Users</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<h2>All Users</h2>

	<table border="1" width="80%" align="center">
		<tr>
			<th>User ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Contact No</th>
			<th>Role</th>
			<th>Age</th>
			<th>Grade</th>
			<th>Class ID</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>

		<%
		List<Map<String, Object>> userList = (List<Map<String, Object>>) request.getAttribute("userList");

		if (userList != null && !userList.isEmpty()) {
			
			for (Map<String, Object> user : userList) {
				int userId = (Integer) user.get("user_id");
		%>
		<tr>
			<td><%=user.get("user_id")%></td>
			<td><%=user.get("name")%></td>
			<td><%=user.get("email")%></td>
			<td><%=user.get("contact_no")%></td>
			<td><%=user.get("role")%></td>
			<td><%=user.get("age")%></td>
			<td><%=user.get("grade")%></td>
			<td><%=user.get("class_id")%></td>
			<td><a href="AdminUpdateUserController?userId=<%=userId%>">Update</a></td>
			<td><a href="AdminDeleteUserController?userId=<%=user.get("user_id")%>"
				onclick="return confirm('Are you sure ?');">Delete</a></td>

		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td colspan="8">No users found.</td>
		</tr>
		<%
		}
		%>

	</table>

</body>
</html>
