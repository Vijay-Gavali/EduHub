<%@ page import="java.util.Map" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Class - EduHub Admin</title>
<link rel="stylesheet" type="text/css" href="css/AdminUpdateClass.css">
<style>
    <%@include file="css/AdminUpdateClass.css"%>
</style>
</head>
<body>
<jsp:include page="./AdminDashboard.jsp"></jsp:include>

<div class="content-area">
    <div class="update-class-container">
        <div class="form-header">
            <h2>Update Class</h2>
        </div>

        <%
        Map<String, Object> cls = (Map<String, Object>) request.getAttribute("class");
        if (cls != null) {
        %>

        <form class="update-class-form" action="AdminUpdateClassController" method="post">
            <div class="form-group">
                <label for="classId">Class ID:</label>
                <input type="text" id="classId" name="classId" 
                       value="<%=cls.get("classId")%>" class="readonly-field" readonly>
            </div>

            <div class="form-group">
                <label for="className">Class Name:</label>
                <input type="text" id="className" name="className" 
                       value="<%=cls.get("className")%>" required>
            </div>

            <div class="form-group">
                <label for="fees">Fees (₹):</label>
                <input type="number" id="fees" name="fees" 
                       value="<%=cls.get("fees")%>" required min="0" step="0.01">
            </div>

            <div class="form-actions">
                <button type="submit" class="submit-btn">Update Class</button>
                <a href="AdminClassController" class="cancel-btn">Cancel</a>
            </div>
        </form>

        <%
        } else {
        %>
        <div class="error-message">
            <p>No class data available to update.</p>
            <a href="AdminClassController" class="back-btn">Back to Classes</a>
        </div>
        <%
        }
        %>
    </div>
</div>

</body>
</html>