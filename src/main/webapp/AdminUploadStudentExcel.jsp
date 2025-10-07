<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Student Excel</title>
    <link rel="stylesheet" href="css/AdminUploadStudentExcel.css">
    <style><%@include file="css/AdminUploadStudentExcel.css"%></style>
</head>
<body>
<jsp:include page="./AdminDashboard.jsp"></jsp:include>

<div class="content-area">
    <div class="container">
        <h2>Upload Student Excel File</h2>
        
        <div class="instructions">
            <h3>Upload Instructions:</h3>
            <ul>
                <li>Only .xlsx files are supported</li>
                <li>Ensure the Excel file follows the required format</li>
                <li>File should contain student details in specified columns</li>
                <li>Maximum file size: 10MB</li>
            </ul>
        </div>

        <form action="AdminUploadStudentExcelController" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="fileInput">Select Excel File:</label>
                <input type="file" id="fileInput" name="file" accept=".xlsx" required>
                <div class="file-hint">Only .xlsx files are allowed</div>
            </div>
            
            <input type="submit" value="Upload and Import Students">
        </form>
    </div>
</div>

</body>
</html>