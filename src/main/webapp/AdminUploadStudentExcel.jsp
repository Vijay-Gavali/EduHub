<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Student Excel</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Upload Student Excel File</h2>

    <form action="AdminUploadStudentExcelController" method="post" enctype="multipart/form-data">
        <label>Select Excel File (.xlsx):</label>
        <input type="file" name="file" accept=".xlsx" required>
        <br><br>
        <input type="submit" value="Upload and Import">
    </form>
</body>
</html>
