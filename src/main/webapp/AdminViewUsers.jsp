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
                            <a href="AdminUpdateUserController?userId=<%=userId%>">
                                Update
                            </a>
                            <a href="AdminDeleteUserController?userId=<%=userId%>"
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

    <script>
        // Enhanced confirmation dialog
        document.addEventListener('DOMContentLoaded', function() {
            const deleteLinks = document.querySelectorAll('a[href*="Delete"]');
            deleteLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    const userName = this.closest('tr').querySelector('td:nth-child(2)').textContent;
                    if (!confirm(`Are you sure you want to delete user "${userName}"? This action cannot be undone.`)) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
</body>
</html>