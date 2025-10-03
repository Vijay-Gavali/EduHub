<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.model.Teacher" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Dashboard - Add Students Attendance</title>
<link rel="stylesheet" href="css/teacherDashboard.css" type="text/css">
<style>
/* ===== Layout & General Styles ===== */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
}

/* Navbar */
.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 60px;
    background: linear-gradient(135deg, #667eea, #764ba2);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
    z-index: 1000;
    color: white;
}
.navbar .brand-name {
    font-size: 20px;
    font-weight: bold;
}
.logout-btn a {
    color: white;
    text-decoration: none;
    padding: 8px 15px;
    background: rgba(255,255,255,0.2);
    border-radius: 5px;
}
.logout-btn a:hover { background: rgba(255,255,255,0.3); }

/* Sidebar */
.dashboard-menu {
    position: fixed;
    left: 0;
    top: 60px;
    width: 220px;
    height: calc(100% - 60px);
    background: linear-gradient(180deg, #2c3e50, #34495e);
    padding-top: 20px;
    box-shadow: 2px 0 5px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
}
.dashboard-menu ul { list-style: none; padding: 0; margin: 0; }
.dashboard-menu li { border-bottom: 1px solid rgba(255,255,255,0.1); }
.dashboard-menu a {
    display: block;
    color: #ecf0f1;
    text-decoration: none;
    padding: 12px 20px;
}
.dashboard-menu a.active, .dashboard-menu a:hover {
    background: rgba(255,255,255,0.1);
    border-left: 4px solid #3498db;
}

/* Content */
.content {
    margin-left: 220px;
    padding: 80px 20px 20px 20px;
}

/* Table */
table {
    border-collapse: collapse;
    width: 100%;
    max-width: 800px;
    margin: 20px auto;
}
th, td {
    border: 1px solid #333;
    padding: 10px;
    text-align: center;
}
th { background-color: #4CAF50; color: white; }

/* Search & Export Buttons */
#searchInput { width: 300px; padding: 8px; margin-bottom: 15px; border-radius: 5px; border: 1px solid #ccc; }
.export-buttons { display: flex; justify-content: center; gap: 15px; margin-bottom: 15px; }
button, .btn-link {
    padding: 8px 15px; border-radius: 5px; border: none; cursor: pointer; color: white;
}
.btn-excel { background-color: #217346; }
.btn-pdf { background-color: #d32f2f; }
.btn-excel:hover { background-color: #1a5a36; }
.btn-pdf:hover { background-color: #b71c1c; }

/* ===== Responsive ===== */
@media screen and (max-width: 768px) {
    .dashboard-menu {
        transform: translateX(-100%);
        position: fixed;
        z-index: 1001;
    }
    .dashboard-menu.active {
        transform: translateX(0);
    }
    .content {
        margin-left: 0;
        padding: 80px 15px 15px 15px;
    }
    #searchInput { width: 90%; }
    .export-buttons { flex-direction: column; gap: 10px; }
    table { font-size: 14px; }
}
.menu-toggle {
    display: none;
    font-size: 22px;
    cursor: pointer;
}
@media screen and (max-width: 768px) {
    .menu-toggle { display: block; color: white; }
}

button.action-btn { padding:5px 10px; margin:2px; border:none; border-radius:4px; cursor:pointer; color:white; }
button.present { background-color:#28a745; }
button.absent { background-color:#dc3545; }
</style>
</head>
<body>

<!-- Navbar & Sidebar (unchanged) -->

<!-- Navbar -->
<nav class="navbar">
    <span class="menu-toggle" onclick="toggleSidebar()">☰</span>
    <div class="brand-name">EduHub Teacher</div>
    <div class="logout-btn">
        <a href="logout.jsp">Logout</a>
    </div>
</nav>

<!-- Sidebar -->
<div class="dashboard-menu" id="sidebar">
    <ul>
    <li><a href="TeacherAssignedClasses">View Assigned Classes</a></li>
        <li><a href="TeacherStudentList" >View Enrolled Students</a></li>
        <li><a href="TeacherAttendance">Mark & View Attendance</a></li>
        
    </ul>
</div>

<div class="content">
    <h2>Students Assigned to You</h2>

    <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Search by student name">

    <div class="export-buttons">
        <button onclick="exportTableToExcel()" class="btn-link btn-excel">Export to Excel</button>
        <button onclick="exportTableToPDF()" class="btn-link btn-pdf">Export to PDF</button>
    </div>

    <table id="studentTable">
        <tr>
            <th>sr.no</th>
            <th>Student Name</th>
            <th>Action</th>
        </tr>
        <%
            List<Teacher> students = (List<Teacher>) request.getAttribute("students");
            int count = 1;
            if (students != null && !students.isEmpty()) {
                for (Teacher s : students) {
        %>
        <tr>
            <td><%= count++ %></td>
            <td><%= s.getStudentName() %></td>
            <td>
              <form method="post" action="Teachersaveattendance">
    <input type="hidden" name="studentId" value="<%=s.getStudentId()%>">
    <button type="submit" name="status" value="Present" class="action-btn present">Present</button>
    <button type="submit" name="status" value="Absent" class="action-btn absent">Absent</button>
</form>

            </td>
        </tr>
        <%  } 
            } else { %>
        <tr>
            <td colspan="3">No students assigned.</td>
        </tr>
        <% } %>
    </table>
</div>

<!-- Search & Export scripts remain unchanged -->

</body>
</html>
