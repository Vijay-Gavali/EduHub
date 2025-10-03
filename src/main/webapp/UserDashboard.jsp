<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.controller.UserAttendanceController.AttendanceRecord" %>
<%@ page import="com.controller.UserFeesController.FeeRecord" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/userdashboard.css" type="text/css">
<style><%@include file="css/userdashboard.css"%></style>
</head>
<body>
<%
    if (session == null || session.getAttribute("role") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String role = (String) session.getAttribute("role");
    String name = (String) session.getAttribute("name");

    String view = request.getParameter("view");
    if (view == null) {
        view = "menu"; // default view
    }
%>

<!-- Navbar matching Index.jsp -->
<nav class="navbar navbar-expand-lg navbar-dark nav-bg fixed-top ms-1 me-1">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="Index.jsp">
      <img src="media/ed hub logo.png" alt="Edu Hub Logo" width="60" height="60" class="d-inline-block me-2">
      Edu Hub
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
            data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto nav-textcolor">
        <li class="nav-item"><a class="nav-link" href="Index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="About.jsp">About</a></li>
        <li class="nav-item"><a class="nav-link active" href="StudentLife.jsp">Student Life</a></li>
        <li class="nav-item"><a class="nav-link" href="Gallery.jsp">Gallery</a></li>
        <li class="nav-item"><a class="nav-link" href="Achievements.jsp">Achievements</a></li>
        <li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact</a></li>

        <% if (role != null) { %>
            <li class="nav-item">
                <% if ("Admin".equalsIgnoreCase(role)) { %>
                    <a class="nav-link btn btn-outline-warning ms-2 px-3 py-1 rounded" href="AdminDashboard.jsp">Dashboard</a>
                <% } else if ("Teacher".equalsIgnoreCase(role)) { %>
                    <a class="nav-link btn btn-outline-info ms-2 px-3 py-1 rounded" href="TeacherDashboard.jsp">Dashboard</a>
                <% } else { %>
                    <a class="nav-link btn btn-outline-success ms-2 px-3 py-1 rounded" href="UserDashboard.jsp">Dashboard</a>
                <% } %>
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-danger ms-2 px-3 py-1 rounded" href="logout.jsp">Logout</a>
            </li>
        <% } else { %>
            <li class="nav-item">
                <a class="nav-link btn btn-outline-light ms-2 px-3 py-1 rounded" href="login.jsp">Login</a>
            </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>

<!-- Content -->
<div class="container-fluid" style="margin-top: 90px;">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 col-lg-2 bg-light p-3 border-end sidebar">
            <h5 class="text-center mb-3">Dashboard Menu</h5>
            <form action="UserDashboard.jsp" method="get" class="d-grid gap-2 mb-2">
                <input type="hidden" name="view" value="student"/>
                <button type="submit" class="btn btn-primary w-100">Student Details</button>
            </form>
            <form action="UserAttendanceController" method="get" class="d-grid gap-2 mb-2">
                <button type="submit" class="btn btn-success w-100">Attendance</button>
            </form>
            <form action="UserFeesController" method="get" class="d-grid gap-2 mb-2">
                <button type="submit" class="btn btn-warning w-100">Fees</button>
            </form>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 p-4">
            <div class="alert alert-primary text-center">
                Welcome <strong><%= role %></strong>, <%= name %>
            </div>

            <!-- Student Details Card -->
            <section id="student" class="card mb-4" style="<%= "student".equals(view) ? "" : "display:none;" %>">
                <div class="card-body">
                    <h3 class="card-title">Student Details</h3>
                    <p><strong>Name:</strong> <%= session.getAttribute("studentName") != null ? session.getAttribute("studentName") : "N/A" %></p>
                    <p><strong>Admission No:</strong> <%= session.getAttribute("admission_no") != null ? session.getAttribute("admission_no") : "N/A" %></p>
                    <p><strong>Admission Date:</strong> <%= session.getAttribute("admission_date") != null ? session.getAttribute("admission_date") : "N/A" %></p>
                    <p><strong>Grade:</strong> <%= session.getAttribute("grade") != null ? session.getAttribute("grade") : "N/A" %></p>
                    
                    <%
                        String extra = (String) session.getAttribute("childrenHtml");
                        if (extra != null) {
                    %>
                        <div class="extra-children"><%= extra %></div>
                    <%
                        }
                    %>
                </div>
            </section>

            <!-- Attendance Card -->
            <section id="attendance" class="card mb-4" style="<%= "attendance".equals(view) ? "" : "display:none;" %>">
                <div class="card-body">
                    <h3 class="card-title">Attendance</h3>
                    <%
                        List<AttendanceRecord> attendanceList =
                            (List<AttendanceRecord>) session.getAttribute("attendanceList");

                        if (attendanceList == null || attendanceList.isEmpty()) {
                    %>
                        <p>No attendance records available.</p>
                    <%
                        } else {
                    %>
                        <table class="table table-bordered text-center">
                            <thead class="table-light">
                                <tr>
                                    <th>Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                for (AttendanceRecord record : attendanceList) {
                            %>
                                <tr>
                                    <td><%= record.getDate() %></td>
                                    <td><%= record.getStatus() %></td>
                                </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    <%
                        }
                    %>
                </div>
            </section>

            <!-- Fees Card -->
            <section id="fees" class="card mb-4" style="<%= "fees".equals(view) ? "" : "display:none;" %>">
                <div class="card-body">
                    <h3 class="card-title">Fees</h3>
                    <%
                        List<FeeRecord> feesList = (List<FeeRecord>) session.getAttribute("feesList");

                        if (feesList == null || feesList.isEmpty()) {
                    %>
                        <p>No fees records available.</p>
                    <%
                        } else {
                    %>
                        <table class="table table-bordered text-center">
                            <thead class="table-light">
                                <tr>
                                    <th>Amount</th>
                                    <th>Due Date</th>
                                    <th>Status</th>
                                    <th>Payment Date</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                for (FeeRecord record : feesList) {
                            %>
                                <tr>
                                    <td><%= record.getAmount() %></td>
                                    <td><%= record.getDueDate() %></td>
                                    <td><%= record.getPaymentStatus() %></td>
                                    <td><%= record.getPaymentDate() != null ? record.getPaymentDate() : "-" %></td>
                                </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    <%
                        }
                    %>
                </div>
            </section>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
