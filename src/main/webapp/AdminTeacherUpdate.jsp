<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List, com.model.Classes"%>
<%@ page import="java.sql.*, com.dbconnection.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<title>Update Teacher</title>
<link rel="stylesheet" type="text/css" href="css/AdminTeacherUpdate.css">
</head>
<body>
	<jsp:include page="./AdminDashboard.jsp"></jsp:include>
	<div class="content-area">	
		<div class="update-teacher-container">
			<h2>Update Teacher</h2>

			<%
			Map<String, Object> user = (Map<String, Object>) request.getAttribute("user");
			List<Classes> classList = (List<Classes>) request.getAttribute("classList");

			if (user != null) {
				// Get the current class ID of the teacher
				int currentClassId = 0;
				Object classIdObj = user.get("class_id");
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

			<form class="update-teacher-form" action="AdminUpdateTeacherController" method="post">
				<input type="hidden" name="user_id" value="<%=user.get("user_id")%>">

				<div class="form-group">
					<label for="name">Name:</label> 
					<input type="text" id="name" name="name" value="<%=user.get("name")%>" required>
				</div>

				<div class="form-group">
					<label for="email">Email:</label> 
					<input type="email" id="email" name="email" value="<%=user.get("email")%>" required>
				</div>

				<div class="form-group">
					<label for="contact_no">Contact No:</label> 
					<input type="text" id="contact_no" name="contact_no" value="<%=user.get("contact_no")%>" required>
				</div>

				<div class="form-group">
					<label for="password">Password:</label> 
					<input type="text" id="password" name="password" value="<%=user.get("password")%>" required>
				</div>

				<div class="form-group">
					<label for="class_id">Assign Class To Teacher:</label> 
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
								// Check if this is the teacher's current class
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

				<button type="submit" class="submit-btn">Update Teacher</button>
				<a href="AdminUserController" class="back-btn">Cancel</a>
			</form>

			<%
			} else {
			%>
			<div class="error-message">
				User details not available.
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>