<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>

<!DOCTYPE html>
<html>
<head>
<title>EduHub Admin - All Teacher</title>
<link rel="stylesheet" type="text/css" href="css/AdminViewUser.css">
<style>
    <%@include file="css/AdminViewUser.css"%>
</style>
</head>
<body>
    <jsp:include page="./AdminDashboard.jsp"></jsp:include>

    <div class="main-content">
        <h2>All Teacher</h2>
        
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact No</th>
                        <th>Class ID</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<Map<String, Object>> teacherList = (List<Map<String, Object>>) request.getAttribute("teacherList");

                    if (teacherList != null && !teacherList.isEmpty()) {
                        for (Map<String, Object> user : teacherList) {
                            int userId = (Integer) user.get("user_id");
                            Object classId = user.get("class_id");
                    %>
                    <tr>
                        <td><strong><%=userId%></strong></td>
                        <td><%=user.get("name")%></td>
                        <td><%=user.get("email")%></td>
                        <td><%=user.get("contact_no")%></td>
                        <td><%=classId != null ? classId : "N/A"%></td>
                        <td>
                            <a href="AdminUpdateTeacherController?userId=<%=userId%>">
                                Update
                            </a>
                            <a href="AdminDeleteTeacherController?userId=<%=userId%>"
                               onclick="return confirm('Are you sure you want to delete this user?');">
                                Delete
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7">
                            <div class="empty-state">
                                📝 No users found in the system.
                            </div>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>