<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login - EduHub School Management</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="css/login.css">
<style>
<%@include file="css/login.css"%>
</style>
</head>
<body class="bg-light">

	<div class="container d-flex justify-content-center align-items-center"
		style="min-height: 100vh;">
		<div class="card shadow p-4" style="width: 100%; max-width: 400px;">
			<!-- School Branding -->
			<div class="school-brand">
				<div class="school-logo">EH</div>
				<div class="school-name">EduHub Academy</div>
			</div>

			<h2 class="text-center mb-4">Login</h2>

			<%
			String err = (String) request.getAttribute("errorMessage");
			String prevPhone = request.getParameter("phone") != null ? request.getParameter("phone") : "";
			if (err != null) {
			%>
			<div class="alert alert-danger text-center"><%=err%></div>
			<%
			}
			%>

			<form action="LoginController" method="post">
				<div class="mb-3">
					<label for="phone" class="form-label">Phone Number</label> <input
						type="text" id="phone" name="phone" class="form-control"
						placeholder="Enter phone number" value="<%=prevPhone%>" required />
				</div>

				<div class="mb-3">
					<label for="password" class="form-label">Password</label> <input
						type="password" id="password" name="password" class="form-control"
						placeholder="Enter password" required />
				</div>

				<div class="d-grid">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>
			</form>
		</div>
	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>