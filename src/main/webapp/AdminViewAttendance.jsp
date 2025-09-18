<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>View Attendance</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #f4f6f9;
}

h2, h3 {
	text-align: center;
	color: #2c3e50;
}

form {
	width: 40%;
	margin: 20px auto;
	padding: 20px;
	background: #fff;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
	border-radius: 6px;
}

input[type=number] {
	width: 90%;
	padding: 10px;
	margin-bottom: 15px;
}

input[type=submit] {
	padding: 10px 20px;
	background: #2c3e50;
	color: white;
	border: none;
	cursor: pointer;
}

input[type=submit]:hover {
	background: #1a252f;
}

table {
	width: 60%;
	margin: 20px auto;
	border-collapse: collapse;
	background: #fff;
}

th, td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
}

th {
	background: #2c3e50;
	color: #fff;
}

tr:nth-child(even) {
	background: #f9f9f9;
}
</style>
</head>
<body>
	<h2>View Student Attendance</h2>
	<form action="AdminViewAttendanceController" method="get">
		<label>Enter Student ID:</label><br> <input type="number"
			name="studentId" required><br> <input type="submit"
			value="View Attendance">
	</form>

	<%
	List<String[]> attendanceList = (List<String[]>) request.getAttribute("attendanceList");
	String studentName = (String) request.getAttribute("studentName");
	Integer studentId = (Integer) request.getAttribute("studentId");

	if (studentId != null) {
	%>
	<h3>
		Student ID:
		<%=studentId%></h3>
	<h3>
		Name:
		<%=(studentName != null ? studentName : "Unknown")%></h3>

	<%
	if (attendanceList != null && !attendanceList.isEmpty()) {
	%>
	<table>
		<tr>
			<th>Date</th>
			<th>Status</th>
		</tr>
		<%
		for (String[] record : attendanceList) {
		%>
		<tr>
			<td><%=record[0]%></td>
			<td><%=record[1]%></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	} else {
	%>
	<p style="text-align: center; color: red;">No attendance records
		found.</p>
	<%
	}
	%>
	<%
	}
	%>
</body>
</html>
