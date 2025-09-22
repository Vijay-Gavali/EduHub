<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/userdashboard.css">
</head>
<body>
<%
    if (session == null || session.getAttribute("role") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String role = (String) session.getAttribute("role");
    String name = (String) session.getAttribute("name");
%>

<header class="navbar">
    <div class="brand">EduHub</div>
    <div class="welcome">Welcome <strong><%= role %></strong>, <%= name %></div>
</header>

<main class="container">
    <section class="card">
        <h3>Student Details</h3>
        <p><strong>Name:</strong>
            <%= session.getAttribute("studentName") != null ? session.getAttribute("studentName") : "N/A" %>
        </p>
        <p><strong>Admission No:</strong>
            <%= session.getAttribute("admission_no") != null ? session.getAttribute("admission_no") : "N/A" %>
        </p>
        <p><strong>Admission Date:</strong>
            <%= session.getAttribute("admission_date") != null ? session.getAttribute("admission_date") : "N/A" %>
        </p>
        <p><strong>Grade:</strong>
            <%= session.getAttribute("grade") != null ? session.getAttribute("grade") : "N/A" %>
        </p>

        <%
            String extra = (String) session.getAttribute("childrenHtml");
            if (extra != null) {
        %>
            <div class="extra-children"><%= extra %></div>
        <%
            }
        %>
    </section>

    <section class="card">
        <h3>Attendance</h3>
        <p><%= session.getAttribute("attendance") != null ? session.getAttribute("attendance") : "Not Available" %></p>
    </section>

    <section class="card">
        <h3>Fees</h3>
        <p><%= session.getAttribute("fees_status") != null ? session.getAttribute("fees_status") : "Not Available" %></p>
    </section>

    

    <div class="logout">
        <a href="logout.jsp">Logout</a>

    </div>
</main>
</body>
</html>
