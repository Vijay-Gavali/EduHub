<%@ page import="java.sql.*, com.dbconnection.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
    <link rel="stylesheet" type="text/css" href="css/userRegistration.css">
</head>
<body>
<jsp:include page="./AdminDashboard.jsp"></jsp:include>

    <div class="form-container">
        <form action="UserRegistration" method="post">
            <h2>Student Registration</h2>
            
            <!-- Display Messages -->
            <% 
            String message = (String) request.getAttribute("message");
            String messageType = (String) request.getAttribute("messageType");
            if (message != null) { 
            %>
                <div class="message <%= messageType %>">
                    <%= message %>
                </div>
            <% } %>
            
            <!-- Admission details -->
            <div class="form-group">
                <label>Admission Date:</label>
                <input type="date" name="admission_date" />
            </div>

            <!-- Personal details -->
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" required />
            </div>

            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required />
            </div>

            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required />
            </div>

            <div class="form-group">
                <label>Father's Name:</label>
                <input type="text" name="father_name" />
            </div>

            <div class="form-group">
                <label>Mother's Name:</label>
                <input type="text" name="mother_name" />
            </div>

            <div class="form-group">
                <label>Date of Birth:</label>
                <input type="date" name="dob" />
            </div>

            <div class="form-group">
                <label>Aadhar Number:</label>
                <input type="text" name="aadhar_no" />
            </div>

            <div class="form-group">
                <label>Parent Aadhar Number:</label>
                <input type="text" name="parent_aadhar" />
            </div>

            <div class="form-group">
                <label>Phone:</label>
                <input type="text" name="phone" />
            </div>

            <div class="form-group">
                <label>Contact Number (for Parent):</label>
                <input type="text" name="contact_no" />
            </div>

            <div class="form-group">
                <label>Age:</label>
                <input type="number" name="age" />
            </div>

            <div class="form-group">
                <label>Grade:</label>
                <input type="text" name="grade" />
            </div>

            <div class="form-group">
                <label>Select Class:</label> 
                <select name="class_id" required>
                    <option value="">Select a Class</option>
                    <%
                        try {
                            Connection con = DBConnection.getConnection();
                            String sql = "SELECT class_id, class_name FROM class";
                            PreparedStatement ps = con.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();
                            while(rs.next()) {
                                int id = rs.getInt("class_id");
                                String className = rs.getString("class_name");
                    %>
                                <option value="<%= id %>"><%= className %></option>
                    <%
                            }
                            rs.close();
                            ps.close();
                            con.close();
                        } catch(Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <input type="submit" value="Register Student" />
            </div>
        </form>
    </div>
</body>
</html>