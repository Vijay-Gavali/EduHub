<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" type="text/css" href="css/userRegistration.css">
    <script>
        function toggleStudentFields() {
            var role = document.querySelector('select[name="role"]').value;
            var studentFields = document.querySelectorAll('.student-field');
            if(role === "Student") {
                studentFields.forEach(f => f.style.display = "block");
            } else {
                studentFields.forEach(f => f.style.display = "none");
            }
        }
        window.onload = function() {
            toggleStudentFields(); // hide fields on page load
            document.querySelector('select[name="role"]').addEventListener('change', toggleStudentFields);
        }
    </script>
</head>
<body>
    <div class="form-container">
        <form action="UserRegistration" method="post">
            <h2>User Registration</h2>

            <!-- Admission details -->
            <div class="form-group">
                <label>Admission Number:</label>
                <input type="text" name="admission_no" />
            </div>

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
                <label>Email (Gmail):</label>
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
                <label>Role:</label>
                <select name="role" required>
                    <option value="">Select Role</option>
                    <option value="Student">Student</option>
                    <option value="Parent">Parent</option>
                </select>
            </div>

            <!-- Student-only fields -->
            <div class="form-group student-field">
                <label>Age:</label>
                <input type="number" name="age" />
            </div>

            <div class="form-group student-field">
                <label>Grade:</label>
                <input type="text" name="grade" />
            </div>

            <div class="form-group student-field">
                <label>Select Class:</label>
                <select name="class_id">
                    <option value="">Select Class</option>
                    <option value="1">1st Standard</option>
                    <option value="2">2nd Standard</option>
                    <option value="3">3rd Standard</option>
                    <option value="4">4th Standard</option>
                    <option value="5">5th Standard</option>
                    <option value="6">6th Standard</option>
                    <option value="7">7th Standard</option>
                    <option value="8">8th Standard</option>
                    <option value="9">9th Standard</option>
                    <option value="10">10th Standard</option>
                </select>
            </div>

            <div class="form-group">
                <input type="submit" value="Register User" />
            </div>
        </form>
    </div>
</body>
</html>
