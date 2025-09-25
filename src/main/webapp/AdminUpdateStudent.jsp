<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*, com.dbconnection.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Student - EduHub Admin</title>
    <link rel="stylesheet" type="text/css" href="css/AdminUpdateStudent.css">
    <style>
        <%@include file="css/AdminUpdateStudent.css"%>
    </style>
</head>
<body>
<jsp:include page="./AdminDashboard.jsp"></jsp:include>

<div class="content-area">
    <div class="update-student-container">
        <h2>Update Student</h2>

        <%
            // Display error/success messages
            String error = request.getParameter("error");
            String success = request.getParameter("success");
            
            if (error != null) {
        %>
            <div class="error-message">
                <%= error %>
            </div>
        <%
            }
            if (success != null) {
        %>
            <div class="success-message">
                <%= success %>
            </div>
        <%
            }
        %>

        <%
            Map<String, Object> student = (Map<String, Object>) request.getAttribute("student");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            if (student != null) {
                // Get the current class ID of the student
                int currentClassId = 0;
                Object classIdObj = student.get("class_id");
                if (classIdObj != null) {
                    if (classIdObj instanceof Integer) {
                        currentClassId = (Integer) classIdObj;
                    } else if (classIdObj instanceof String) {
                        try {
                            currentClassId = Integer.parseInt((String) classIdObj);
                        } catch (NumberFormatException e) {
                            // Handle parsing error if needed
                        }
                    }
                }
        %>
        <form class="update-student-form" action="AdminUpdateStudentController" method="post">
            <input type="hidden" name="user_id" value="<%= student.get("user_id") %>">
            
            <!-- Read-only Admission Fields -->
            <div class="form-row">
                <div class="form-group">
                    <label for="admission_no">Admission Number:</label>
                    <input type="text" id="admission_no" name="admission_no" 
                           value="<%= student.get("admission_no") != null ? student.get("admission_no") : "" %>" 
                           class="readonly-field" readonly>
                </div>
                
                <div class="form-group">
                    <label for="admission_date">Admission Date:</label>
                    <input type="date" id="admission_date" name="admission_date" 
                           value="<%= student.get("admission_date") != null ? dateFormat.format(student.get("admission_date")) : "" %>" 
                           class="readonly-field" readonly>
                </div>
            </div>

            <!-- Personal Information -->
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" 
                       value="<%= student.get("name") != null ? student.get("name") : "" %>" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="father_name">Father's Name:</label>
                    <input type="text" id="father_name" name="father_name" 
                           value="<%= student.get("father_name") != null ? student.get("father_name") : "" %>">
                </div>
                
                <div class="form-group">
                    <label for="mother_name">Mother's Name:</label>
                    <input type="text" id="mother_name" name="mother_name" 
                           value="<%= student.get("mother_name") != null ? student.get("mother_name") : "" %>">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <input type="date" id="dob" name="dob" 
                           value="<%= student.get("dob") != null ? dateFormat.format(student.get("dob")) : "" %>">
                </div>
                
                <div class="form-group">
                    <label for="age">Age:</label>
                    <input type="number" id="age" name="age" 
                           value="<%= student.get("age") != null ? student.get("age") : "" %>">
                </div>
            </div>

            <!-- Aadhar Information -->
            <div class="form-row">
                <div class="form-group">
                    <label for="aadhar_no">Aadhar Number:</label>
                    <input type="text" id="aadhar_no" name="aadhar_no" 
                           value="<%= student.get("aadhar_no") != null ? student.get("aadhar_no") : "" %>">
                </div>
                
                <div class="form-group">
                    <label for="parent_aadhar">Parent's Aadhar:</label>
                    <input type="text" id="parent_aadhar" name="parent_aadhar" 
                           value="<%= student.get("parent_aadhar") != null ? student.get("parent_aadhar") : "" %>">
                </div>
            </div>

            <!-- Contact Information -->
            <div class="form-row">
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" 
                           value="<%= student.get("phone") != null ? student.get("phone") : "" %>">
                </div>
                
                <div class="form-group">
                    <label for="contact_no">Contact No:</label>
                    <input type="text" id="contact_no" name="contact_no" 
                           value="<%= student.get("contact_no") != null ? student.get("contact_no") : "" %>">
                </div>
            </div>

            <!-- Login Information -->
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" 
                           value="<%= student.get("email") != null ? student.get("email") : "" %>" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" 
                           value="<%= student.get("password") != null ? student.get("password") : "" %>" required>
                </div>
            </div>

            <!-- Address -->
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" rows="3"><%= student.get("address") != null ? student.get("address") : "" %></textarea>
            </div>

            <!-- Academic Information -->
            <div class="form-row">
                <div class="form-group">
                    <label for="grade">Grade:</label>
                    <input type="text" id="grade" name="grade" 
                           value="<%= student.get("grade") != null ? student.get("grade") : "" %>">
                </div>
                
                <div class="form-group">
                    <label for="class_id">Assign Class To Student:</label> 
                    <select name="class_id" id="class_id" required>
                        <%
                        try {
                            Connection con = DBConnection.getConnection();
                            String sql = "SELECT class_id, class_name FROM class";
                            PreparedStatement ps = con.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                int id = rs.getInt("class_id");
                                String className = rs.getString("class_name");
                                // Check if this is the student's current class
                                boolean isSelected = (id == currentClassId);
                        %>
                        <option value="<%=id%>" <%=isSelected ? "selected" : ""%>>
                            <%=className%>
                        </option>
                        <%
                            }
                            rs.close();
                            ps.close();
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                    </select>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="form-actions">
                <button type="submit" class="submit-btn">Update Student</button>
                <a href="AdminStudentViewController" class="back-btn">Cancel</a>
            </div>
        </form>
        <%
            } else {
        %>
            <div class="error-message">
                Student data not found.
            </div>
            <a href="AdminStudentViewController" class="back-btn">Back to Student List</a>
        <%
            }
        %>
    </div>
</div>
</body>
</html>