<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>View Attendance</title>
<link rel="stylesheet" type="text/css" href="css/AdminViewAttendance.css">
    <style><%@include file="css/AdminViewAttendance.css"%></style>

</head>
<body>
<jsp:include page="./AdminDashboard.jsp"></jsp:include>

<div class="attendance-container">
    <div class="attendance-header">
        <h2>View Student Attendance</h2>
    </div>

    <form class="attendance-form" action="AdminViewAttendanceController" method="get">
        <div class="form-group">
            <label for="studentId">Enter Student ID:</label>
            <input type="number" id="studentId" name="studentId" required>
        </div>
        <button type="submit" class="submit-btn">View Attendance</button>
    </form>

    <%
    List<String[]> attendanceList = (List<String[]>) request.getAttribute("attendanceList");
    String studentName = (String) request.getAttribute("studentName");
    Integer studentId = (Integer) request.getAttribute("studentId");

    if (studentId != null) {
    %>
        <div class="student-info">
            <h3>Student ID: <%=studentId%></h3>
            <h3>Name: <%=(studentName != null ? studentName : "Unknown")%></h3>
        </div>

        <%
        if (attendanceList != null && !attendanceList.isEmpty()) {
        %>
        <div class="attendance-table-container">
            <table class="attendance-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (String[] record : attendanceList) {
                        String statusClass = "present".equalsIgnoreCase(record[1]) ? "status-present" : 
                                           "absent".equalsIgnoreCase(record[1]) ? "status-absent" : "";
                    %>
                    <tr>
                        <td><%=record[0]%></td>
                        <td><span class="<%=statusClass%>"><%=record[1]%></span></td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
        <%
        } else {
        %>
        <div class="no-records">
            No attendance records found for this student.
        </div>
        <%
        }
    }
    %>
</div>
</body>
</html>