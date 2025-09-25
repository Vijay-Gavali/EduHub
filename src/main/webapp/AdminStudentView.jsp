<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>

<!DOCTYPE html>
<html>
<head>
    <title>All Students - EduHub Admin</title>
    <link rel="stylesheet" type="text/css" href="css/AdminViewStudent.css">
    <style><%@include file="css/AdminViewStudent.css"%></style>
    
</head>
<body>
<jsp:include page="./AdminDashboard.jsp"></jsp:include>
<div class="table-container">
        <h2>All Students</h2>

        <table border="1">
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Contact No</th>
                <th>Class ID</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>

            <%
            List<Map<String, Object>> studentList = (List<Map<String, Object>>) request.getAttribute("studentList");

            if (studentList != null && !studentList.isEmpty()) {
                for (Map<String, Object> user : studentList) {
                    int userId = (Integer) user.get("user_id");
            %>
            <tr>
                <td><%=user.get("user_id")%></td>
                <td><%=user.get("name")%></td>
                <td><%=user.get("email")%></td>
                <td><%=user.get("contact_no")%></td>
                <td><%=user.get("class_id")%></td>
                <td><a href="AdminUpdateStudentController?userId=<%=userId%>">Update</a></td>
                <td><a href="AdminDeleteUserController?userId=<%=user.get("user_id")%>" 
                       onclick="return confirm('Are you sure?');">Delete</a></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="7">No students found.</td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
</body>
</html>