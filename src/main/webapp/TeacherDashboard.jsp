<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #f4f4f9;
	margin: 0;
	padding: 0;
}
/* Navbar */
.navbar {
	background: #333;
	color: #fff;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 12px 20px;
}

.navbar h1 {
	margin: 0;
	font-size: 20px;
}

.navbar .menu {
	display: flex;
	gap: 15px;
}

.navbar .menu a {
	color: #fff;
	text-decoration: none;
	font-size: 14px;
	padding: 6px 10px;
	border-radius: 4px;
}

.navbar .menu a:hover {
	background: #555;
}

/* Dashboard Cards */
.dashboard {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 20px;
	padding: 20px;
}

.card {
	background: white;
	padding: 20px;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	text-align: center;
	transition: transform 0.2s;
}

.card:hover {
	transform: translateY(-5px);
}

.card h2 {
	font-size: 18px;
	margin-bottom: 10px;
	color: #333;
}

.card p {
	font-size: 14px;
	color: #555;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<div class="navbar">
		<h1>Teacher Dashboard</h1>
		<div class="menu">
			<a href="profile.jsp">Profile</a> <a href="settings.jsp">Settings</a>
			<a href="logout.jsp">Logout</a>
		</div>
	</div>

	<!-- Dashboard Cards -->
	<div class="dashboard">
		<div class="card">
			<h2>My Courses</h2>
			<p>
				<a href="MyCoursesServlet">View Assigned Courses</a>
			</p>
		</div>
		<div class="card">
			<h2>Students List</h2>
			<p>
				<a href="StudentListServlet">View Enrolled Students</a>
			</p>
		</div>
		<div class="card">
			<h2>Attendance</h2>
			<p>
				<a href="attendance.jsp">Mark & View Attendance</a>
			</p>
		</div>
		</div>