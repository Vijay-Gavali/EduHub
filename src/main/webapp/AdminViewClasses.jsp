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
</head>
<body>

	<h2>All Classes</h2>

	<table border="1" width="80%" align="center">
		<tr>
			<th>Class ID</th>
			<th>Class Name</th>
			<th>Fees</th>
			<th>Class Teacher</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>

		<%
		List<Classes> classList = (List<Classes>) request.getAttribute("classList");

		if (classList != null && !classList.isEmpty()) {
			for (Classes cls : classList) {
				int classId = cls.getClassId();
		%>
		<tr>
			<td><%=cls.getClassId()%></td>
			<td><%=cls.getClassName()%></td>
			<td><%=cls.getFees()%></td>
			<td><%=cls.getTeacherId()%></td>
			<td><a
				href="AdminUpdateClassController?classId=<%=cls.getClassId()%>">Update</a>
			</td>
			<td><a
				href="AdminDeleteClassController?classId=<%=cls.getClassId()%>"
				onclick="return confirm('Are you sure?');">Delete</a></td>

		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td colspan="4" style="text-align: center;">No classes found.</td>
		</tr>
		<%
		}
		%>

	</table>
</body>
</html>