<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Teacher" %>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Dashboard - EduHub</title>
<link rel="stylesheet" href="css/teacherDashboard.css" type="text/css">
<style>
/* Reset and base styles */
* { margin: 0; padding: 0; box-sizing: border-box; }

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

/* Sidebar Menu */
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

.dashboard-menu ul { list-style: none; width: 100%; }
.dashboard-menu li { width: 100%; border-bottom: 1px solid rgba(255,255,255,0.1); }
.dashboard-menu li:last-child { border-bottom: none; }

.dashboard-menu a {
    display: block;
    color: #ecf0f1;
    text-decoration: none;
    padding: 15px 25px;
    transition: all 0.3s ease;
    font-size: 16px;
    border-left: 4px solid transparent;
}

.dashboard-menu a:hover {
    background: rgba(255,255,255,0.1);
    border-left: 4px solid #3498db;
    padding-left: 30px;
}

/* Content Area */
.content-area {
    margin-left: 250px;
    padding: 100px 30px 30px 30px;
    width: calc(100% - 250px);
    min-height: calc(100vh - 80px);
}

.content-area h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 20px;
}

table {
    border-collapse: collapse;
    width: 70%;
    margin: 0 auto;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0px 4px 12px rgba(0,0,0,0.15);
}

th, td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
}

th { background-color: #3498db; color: white; }

tr:nth-child(even) { background-color: #f9f9f9; }
tr:hover { background-color: #f1f1f1; }

.present { color: green; font-weight: bold; }
.absent { color: red; font-weight: bold; }

/* Pagination */
.pagination {
    text-align: center;
    margin-top: 20px;
}

.pagination button {
    padding: 6px 12px;
    margin: 0 2px;
    border: 1px solid #3498db;
    background-color: #fff;
    color: #3498db;
    cursor: pointer;
    border-radius: 4px;
}

.pagination button.active {
    background-color: #3498db;
    color: #fff;
}

.pagination button:hover {
    background-color: #2980b9;
    color: #fff;
}

/* Responsive */
@media (max-width: 768px) {
    .dashboard-menu { width: 200px; }
    .content-area { margin-left: 200px; width: calc(100% - 200px); }
}
@media (max-width: 480px) {
    .dashboard-menu { width: 100%; position: relative; }
    .content-area { margin-left: 0; width: 100%; }
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
        <span class="brand-name">EduHub Admin</span>
    </div>
    <div class="logout-btn">
        <a href="logout.jsp">Logout</a>
    </div>
</nav>

<!-- Sidebar -->
<div class="dashboard-menu">
    <ul>
        <li><a href="TeacherAssignedClasses">View Assigned Classes</a></li>
        <li><a href="TeacherStudentList">View Enrolled Students</a></li>
        <li><a href="TeacherAttendance">Mark & View Attendance</a></li>
        <li><a href="TeacherViewAttendance">View Attendance Report</a></li>
    </ul>
</div>

<!-- Main Content -->
<div class="content-area">
    <h2>View Student Attendance</h2>
    <table id="attendanceTable">
        <thead>
            <tr>
                <th>Sr. No.</th>
                <th>Student Name</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody id="tableBody">
        <%
            List<Teacher> attendanceList = (List<Teacher>) request.getAttribute("attendanceList");
            if(attendanceList != null && !attendanceList.isEmpty()) {
                int srNo = 1;
                for(Teacher t : attendanceList) {
        %>
            <tr>
                <td><%= srNo++ %></td>
                <td><%= t.getStudentName() %></td>
                <td><%= t.getAttendanceDate() %></td>
                <td class="<%= ("Present".equalsIgnoreCase(t.getStatus())) ? "present" : "absent" %>">
                    <%= t.getStatus() %>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="4">No attendance records found.</td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <!-- Pagination -->
    <div class="pagination" id="pagination"></div>
</div>

<script>
// Pagination
const rowsPerPage = 10;
const tableBody = document.getElementById('tableBody');
const pagination = document.getElementById('pagination');

const rows = Array.from(tableBody.querySelectorAll('tr'));
const pageCount = Math.ceil(rows.length / rowsPerPage);

function displayPage(page) {
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;
    rows.forEach((row, index) => row.style.display = (index >= start && index < end) ? '' : 'none');
    Array.from(pagination.children).forEach(btn => btn.classList.remove('active'));
    pagination.children[page-1].classList.add('active');
}

// Create pagination buttons
for(let i=1; i<=pageCount; i++) {
    const btn = document.createElement('button');
    btn.innerText = i;
    btn.addEventListener('click', () => displayPage(i));
    if(i===1) btn.classList.add('active');
    pagination.appendChild(btn);
}

displayPage(1); // show first page
</script>
</body>
</html>
