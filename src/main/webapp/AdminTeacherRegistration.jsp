<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Registration</title>
<link rel="stylesheet" type="text/css" href="css/userRegistration.css">
</head>
<body>

	<h2>Registration</h2>
	<form action="AdminTeacherRegistration" method="post">
		<label>Name:</label>
		<input type="text" name="name" required /><br />
		
		<label>Email:</label>
		<input type="email" name="email" required /><br />
		
		<label>Password:</label>
		<input type="password" name="password" required /><br /> 
			
			<label>Contact Number:</label>
			<input type="text" name="contact_no" required /><br /> 
			
			<label>Role:</label> 
			<select name="role" required>
			<option value="Teacher">Teacher</option>
			<option value="Parent">Parent</option>
			<option value="Student">Student</option>
		</select><br /> 
		
		<label>Age (only for Student):</label> 
		<input type="number" name="age" /><br /> 
		
		<label>Grade (only for Student):</label>
		<input type="text" name="grade" /><br />
		
		<label>Select Class(only for Student):</label> 
		<select name="Class_Standard" required>
			<option value="1st_standard">1st standard</option>
			<option value="2nd_standard">2nd standard</option>
			<option value="3rd_standard">3rd standard</option>
			<option value="4th_standard">4th standard</option>
			<option value="5th_standard">5th standard</option>
			<option value="6th_standard">6th standard</option>
			<option value="7th_standard">7th standard</option>
			<option value="8th_standard">8th standard</option>
			<option value="9th_standard">9th standard</option>
			<option value="10th_standard">10th standard</option>
		</select><br />  
		
		<input type="submit" value="Add User" />
	</form>
</body>
</html>
