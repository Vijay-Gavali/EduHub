<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Dashboard - EduHub</title>
<link rel="stylesheet" href="css/teacherDashboard.css" type="text/css">
<style><%@include file="css/teacherDashboard.css"%></style></head>
<body>
	<nav class="navbar">
		<div class="logo-container">
			<div class="logo">
				<img src="media/ed hub logo.png" alt="EduHub Logo">
			</div>
			<span class="brand-name">EduHub </span>
		</div>
		<div class="logout-btn">
			<a href="logout.jsp">Logout</a>
		</div>
	</nav>

	<div class="dashboard-menu">
		<ul>
			
    <li><a href="TeacherAssignedClasses">View Assigned Classes</a></li>
    <li><a href="TeacherStudentList">View Enrolled Students</a></li>
    <li><a href="TeacherAttendance">Mark & View Attendance</a></li> <!-- matches servlet URL -->
     <li><a href="" > View Attendance</a></li>
</ul>




		
	</div>

</body>
</html>