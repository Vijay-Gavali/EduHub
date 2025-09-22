<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.controller.UserAttendanceController.AttendanceRecord" %>
<%@ page import="com.controller.UserFeesController.FeeRecord" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/userdashboard.css">
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
        view = "menu"; // default view: only show menu
    }
%>

<header class="navbar">
    <div class="brand">EduHub</div>
    <div class="welcome">Welcome <strong><%= role %></strong>, <%= name %></div>
</header>

<main>
    <!-- Menu Options -->
    <div class="menu" style="text-align:center; margin-bottom:20px;">
        <form action="UserDashboard.jsp" method="get" style="display:inline;">
            <input type="hidden" name="view" value="student"/>
            <button type="submit">View Student Details</button>
        </form>

        <form action="UserAttendanceController" method="get" style="display:inline;">
            <button type="submit">View Attendance</button>
        </form>

        <form action="UserFeesController" method="get" style="display:inline;">
            <button type="submit">View Fees</button>
        </form>
    </div>

    <!-- Student Details Card -->
    <section id="student" class="card" style="<%= "student".equals(view) ? "" : "display:none;" %>">
        <h3>Student Details</h3>
        <p><strong>Name:</strong> <%= session.getAttribute("studentName") != null ? session.getAttribute("studentName") : "N/A" %></p>
        <p><strong>Admission No:</strong> <%= session.getAttribute("admission_no") != null ? session.getAttribute("admission_no") : "N/A" %></p>
        <p><strong>Admission Date:</strong> <%= session.getAttribute("admission_date") != null ? session.getAttribute("admission_date") : "N/A" %></p>
        <p><strong>Grade:</strong> <%= session.getAttribute("grade") != null ? session.getAttribute("grade") : "N/A" %></p>
        <p><strong>User ID:</strong> <%= session.getAttribute("user_id") != null ? session.getAttribute("user_id") : "N/A" %></p>
        <%
            String extra = (String) session.getAttribute("childrenHtml");
            if (extra != null) {
        %>
            <div class="extra-children"><%= extra %></div>
        <%
            }
        %>
    </section>

    <!-- Attendance Card -->
    <section id="attendance" class="card" style="<%= "attendance".equals(view) ? "" : "display:none;" %>">
        <h3>Attendance</h3>
        <%
            List<AttendanceRecord> attendanceList =
                (List<AttendanceRecord>) session.getAttribute("attendanceList");

            if (attendanceList == null || attendanceList.isEmpty()) {
        %>
            <p>No attendance records available.</p>
        <%
            } else {
        %>
            <table border="1" cellpadding="5" cellspacing="0" style="width:100%; text-align:center;">
                <tr>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
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
            </table>
        <%
            }
        %>
    </section>

    <!-- Fees Card -->
    <section id="fees" class="card" style="<%= "fees".equals(view) ? "" : "display:none;" %>">
        <h3>Fees</h3>
        <%
            List<FeeRecord> feesList = (List<FeeRecord>) session.getAttribute("feesList");

            if (feesList == null || feesList.isEmpty()) {
        %>
            <p>No fees records available.</p>
        <%
            } else {
        %>
            <table border="1" cellpadding="5" cellspacing="0" style="width:100%; text-align:center;">
                <tr>
                    <th>Amount</th>
                    <th>Due Date</th>
                    <th>Status</th>
                    <th>Payment Date</th>
                </tr>
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
            </table>
        <%
            }
        %>
    </section>

    <!-- Logout -->
    <div class="logout" style="text-align:center; margin-top:20px;">
        <a href="logout.jsp">Logout</a>
    </div>
</main>

</body>
</html>
