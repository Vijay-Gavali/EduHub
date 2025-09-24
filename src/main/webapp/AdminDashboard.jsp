<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard - EduHub</title>
<link rel="stylesheet" href="css/AdminDashboard.css" type="text/css">
<style><%@include file="css/AdminDashboard.css"%></style></head>
<body>
	<nav class="navbar">
		<div class="logo-container">
			<div class="logo">
				<img src="media/ed hub logo.png" alt="EduHub Logo">
			</div>
			<span class="brand-name">EduHub Admin</span>
		</div>
		<div class="logout-btn">
			<a href="logout.jsp">Logout</a>
		</div>
	</nav>

	<div class="dashboard-menu">
		<ul>
			<li><a href="AdminTeacherRegistration.jsp">Add New Teacher</a></li>
			<li><a href="AdminStudentRegistration.jsp">Add New Student</a></li>
			<li><a href="AdminUserController">View All Teachers</a></li>
			<li><a href="AdminStudentViewController">View All Students</a></li>
			<li><a href="AdminViewClassesController">View Classes</a></li>
			<li><a href="AdminViewAttendance.jsp">View Attendance</a></li>
			<li><a href="AdminManageFees.jsp">Manage Fees</a></li>
			<li><a href="#">View Enquiries</a></li>
		</ul>
	</div>

</body>
</html>