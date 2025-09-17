<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Class</title>
</head>
<body>

	<h2>Update Class</h2>

	<%
	Map<String, Object> cls = (Map<String, Object>) request.getAttribute("class");
	if (cls != null) {
	%>

	<form action="AdminUpdateClassController" method="post">
		Class Id: <input type="text" name="classId"	value="<%=cls.get("classId")%>" readonly><br> <br>
		Class Name: <input type="text" name="className"	value="<%=cls.get("className")%>" required><br> <br>
		Teacher ID: <input type="number" name="teacherId" value="<%=cls.get("teacherId")%>" required><br> <br>
		Fees: <input type="number" name="fees" value="<%=cls.get("fees")%>" required><br> <br>
		<input type="submit" value="Update Class">
	</form>

	<%
	} else {
	%>
	<p>No class data available to update.</p>
	<%
	}
	%>

</body>
</html>
