<%@ page import="java.util.List" %>
<%@ page import="com.model.Teacher" %>

<%
    List<Teacher> classList = (List<Teacher>) request.getAttribute("classList");
    String teacherName = (String) request.getAttribute("teacherName"); // fetched from session or controller
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Dashboard - Assigned Classes</title>
<style>
/* ===== Dashboard CSS ===== */

/* Reset and base styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    display: flex;
    min-height: 100vh;
}

/* Navigation Bar */
.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 80px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 30px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    z-index: 1000;
}

.logo-container {
    display: flex;
    align-items: center;
    gap: 15px;
}

.brand-name {
    color: white;
    font-size: 28px;
    font-weight: bold;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
}

.logo img {
    height: 60px;
    width: auto;
    border-radius: 6px;
}

.logout-btn a {
    color: white;
    text-decoration: none;
    padding: 10px 20px;
    background: rgba(255,255,255,0.2);
    border-radius: 4px;
    transition: background 0.3s ease;
    font-weight: 500;
    font-size: 16px;
}

.logout-btn a:hover {
    background: rgba(255,255,255,0.3);
    transform: translateY(-1px);
}

/* Sidebar */
.dashboard-menu {
    position: fixed;
    left: 0;
    top: 80px;
    width: 250px;
    height: calc(100vh - 80px);
    background: linear-gradient(180deg, #2c3e50 0%, #34495e 100%);
    padding: 20px 0;
    box-shadow: 2px 0 10px rgba(0,0,0,0.1);
    overflow-y: auto;
}

.dashboard-menu ul {
    list-style: none;
    width: 100%;
}

.dashboard-menu li {
    width: 100%;
    border-bottom: 1px solid rgba(255,255,255,0.1);
}

.dashboard-menu li:last-child {
    border-bottom: none;
}

.dashboard-menu a {
    display: block;
    color: #ecf0f1;
    text-decoration: none;
    padding: 15px 25px;
    transition: all 0.3s ease;
    font-size: 16px;
    border-left: 4px solid transparent;
}

.dashboard-menu a:hover,
.dashboard-menu a.active {
    background: rgba(255,255,255,0.1);
    border-left: 4px solid #3498db;
    padding-left: 30px;
}

/* Content area */
.content-area {
    margin-left: 250px;
    padding: 90px 30px 30px 30px;
    width: calc(100% - 250px);
    min-height: calc(100vh - 80px);
}

/* Teacher Profile Card */
.teacher-profile-card {
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white;
    border-radius: 10px;
    padding: 20px;
    text-align: center;
    width: 300px;
    margin: 20px auto;
    box-shadow: 0 6px 12px rgba(0,0,0,0.15);
}

.teacher-profile-card .profile-pic {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-bottom: 10px;
    border: 2px solid white;
}

/* Class Cards */
.card-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-top: 20px;
}

.class-card {
    background: #e0f7fa;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    width: 220px;
    padding: 15px;
    text-align: center;
    transition: transform 0.2s, box-shadow 0.2s;
}

.class-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0,0,0,0.2);
}

.class-title {
    font-size: 18px;
    font-weight: bold;
    color: #00796b;
    margin-bottom: 8px;
}

.class-info {
    font-size: 14px;
    margin: 4px 0;
    color: #555;
}

p.no-classes {
    text-align: center;
    font-size: 16px;
    color: #777;
    margin-top: 30px;
}

/* Responsive */
@media (max-width: 768px) {
    .dashboard-menu { width: 200px; }
    .content-area { margin-left: 200px; padding: 80px 20px; }
}

@media (max-width: 480px) {
    .dashboard-menu { width: 100%; position: relative; height: auto; top: 0; }
    .content-area { margin-left: 0; width: 100%; padding: 20px; }
}
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
    <div class="logo-container">
        <div class="logo">
            <img src="media/ed hub logo.png" alt="EduHub Logo">
        </div>
        <span class="brand-name">EduHub Teacher</span>
    </div>
    <div class="logout-btn">
        <a href="logout.jsp">Logout</a>
    </div>
</nav>

<div class="dashboard-layout">

    <!-- Sidebar -->
    <div class="dashboard-menu">
       <ul>
    <li><a href="TeacherAssignedClasses">View Assigned Classes</a></li>
    <li><a href="TeacherStudentList">View Enrolled Students</a></li>
    <li><a href="TeacherAttendance">Mark & View Attendance</a></li> <!-- matches servlet URL -->
</ul>

    </div>


    <!-- Content -->
    <div class="content-area">

        <h2>Your Assigned Classes</h2>

        

        <!-- Class Cards -->
        <div class="card-container">
            <%
                if (classList != null && !classList.isEmpty()) {
                    for (Teacher c : classList) {
            %>
            <div class="class-card">
                <div class="class-title"><%= c.getClassName() %></div>
             
                <div class="class-info">Total Students: <%= c.getTotalStudents() %></div>
            </div>
            <%
                    }
                } else {
            %>
            <p class="no-classes">No classes assigned.</p>
            <%
                }
            %>
        </div>

    </div>
</div>

</body>
</html>
