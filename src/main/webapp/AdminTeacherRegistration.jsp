<%@ page import="java.sql.*, com.dbconnection.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Registration</title>
    <link rel="stylesheet" type="text/css" href="css/AdminTeacherRegistration.css">
    <style><%@include file="css/AdminTeacherRegistration.css"%></style>
</head>
<body>
<jsp:include page="./AdminDashboard.jsp"></jsp:include>
    <h2>Teacher Registration</h2>
    <form action="AdminTeacherRegistration" method="post">
        <label>Teacher Name:</label> <input type="text" name="name" required /><br />
        <label>Teacher Email:</label> <input type="email" name="email" required /><br />
        <label>Password:</label> <input type="password" name="password" required /><br />
        <label>Contact Number:</label> <input type="text" name="contact_no" required /><br />

        <label>Assign Class To Teacher:</label> 
        <select name="class_id" required>
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
        </select><br />
        <input type="submit" value="Add Teacher" />
    </form>
</body>
</html>
