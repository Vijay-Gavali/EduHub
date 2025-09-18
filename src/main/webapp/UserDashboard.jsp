<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Dashboard</title>
</head>
<body>
	<%
	// Use implicit 'session' object, no need to redeclare
	if (session == null || !"Parent".equals(session.getAttribute("role"))) {
		response.sendRedirect("login.jsp");
		return;
	}
	String name = (String) session.getAttribute("name");
	%>

	<h2>Welcome to User Dashboard</h2>
	<p>
		Hello, <strong><%=name%></strong>!
	</p>

</body>
</html>
