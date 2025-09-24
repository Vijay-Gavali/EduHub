<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.model.Classes"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Classes</title>
<link rel="stylesheet" href="css/AdminViewClasses.css" type="text/css">
<style><%@include file="css/AdminViewClasses.css"%></style>
</head>
<body>
<jsp:include page="./AdminDashboard.jsp"></jsp:include>
    <div class="container">
        <h2>All Classes</h2>
        
        <!-- Optional: Add button for creating new classes -->
        <div class="button-container">
            <a href="add-class.jsp" class="add-button">+ Add New Class</a>
        </div>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Class ID</th>
                        <th>Class Name</th>
                        <th>Fees</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<Classes> classList = (List<Classes>) request.getAttribute("classList");

                    if (classList != null && !classList.isEmpty()) {
                        for (Classes cls : classList) {
                            int classId = cls.getClassId();
                    %>
                    <tr>
                        <td><%=cls.getClassId()%></td>
                        <td><%=cls.getClassName()%></td>
                        <td>₹<%=cls.getFees()%></td>
                        <td style="text-align: center;">
                            <a href="AdminUpdateClassController?classId=<%=cls.getClassId()%>">Update</a>
                            <a href="AdminDeleteClassController?classId=<%=cls.getClassId()%>" 
                               onclick="return confirm('Are you sure you want to delete this class?');">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" style="text-align: center;">No classes found.</td>
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