<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edu Hub - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/Index.css">
  </head>
  <body>

<%
    String role = (String) session.getAttribute("role");
    String name = (String) session.getAttribute("name");
%>

<!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark nav-bg fixed-top ms-1 me-1">
  <div class="container">
    <!-- Brand Logo with Text -->
    <a class="navbar-brand d-flex align-items-center" href="Index.jsp">
      <img src="media/ed hub logo.png" alt="Edu Hub Logo" width="60" height="60" class="d-inline-block me-2">
      EduHub
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
            data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto nav-textcolor">
        <li class="nav-item"><a class="nav-link" href="Index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="About.jsp">About</a></li>
        <li class="nav-item"><a class="nav-link active" href="StudentLife.jsp">Student Life</a></li>
        <li class="nav-item"><a class="nav-link" href="Gallery.jsp">Gallery</a></li>
        <li class="nav-item"><a class="nav-link" href="Achievements.jsp">Achievements</a></li>
        <li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact</a></li>

        <% if (role == null) { %>
            <li class="nav-item">
                <a class="nav-link nav-btn" href="login.jsp">Login</a>
            </li>
        <% } else { %>
            <li class="nav-item">
                <% if ("Admin".equalsIgnoreCase(role)) { %>
                    <a class="nav-link nav-btn admin-btn" href="AdminDashboard.jsp">Dashboard</a>
                <% } else if ("Teacher".equalsIgnoreCase(role)) { %>
                    <a class="nav-link nav-btn teacher-btn" href="TeacherDashboard.jsp">Dashboard</a>
                <% } else { %>
                    <a class="nav-link nav-btn user-btn" href="UserDashboard.jsp">Dashboard</a>
                <% } %>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-btn logout-btn" href="logout.jsp">Logout</a>
            </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>

<!-- ✅ Banner -->
<div class="banner" style="background-image: url('media/school.jpg'); background-size: cover; background-position: center; height: 70vh; display: flex; align-items: center; justify-content: center; color: white; text-shadow: 2px 2px 5px rgba(0,0,0,0.7);">
  <div class="text-center">
    <h1>Welcome to Edu Hub</h1>
    <p class="lead">Shaping Future Leaders in Pune, India</p>
  </div>
</div>

<!-- ✅ Academics Overview -->
<div class="container-fluid py-5 form-color">
  <div class="text-center mb-4">
    <h2 class="text-dark">SHAPING BRIGHT FUTURE</h2>
    <p class="text-dark">Edu Hub provides a balanced and comprehensive curriculum designed to nurture curiosity, creativity, and lifelong learning among students.</p>
  </div>
  <div class="row g-4">
    <!-- Elementary -->
    <div class="col-md-4">
      <div class="card h-100 form-color-h">
        <img src="media/SCHOOL BOYS.jpg" class="card-img-top" alt="Elementary School">
        <div class="card-body">
          <h4 class="card-title text-dark">Elementary School (Grades 1–5)</h4>
          <p class="card-text">Focus on foundational learning in literacy, numeracy, and creativity. Emphasis on joyful learning and character building.</p>
        </div>
      </div>
    </div>
    <!-- Junior -->
    <div class="col-md-4">
      <div class="card h-100 form-color-h">
        <img src="media/ELEMENTRY SCHOOL.jpg" class="card-img-top" alt="Junior School">
        <div class="card-body">
          <h4 class="card-title text-dark">Junior School (Grades 6–8)</h4>
          <p class="card-text">Development of analytical and problem-solving skills, introduction to advanced sciences, languages, and digital literacy.</p>
        </div>
      </div>
    </div>
    <!-- High -->
    <div class="col-md-4">
      <div class="card h-100 form-color-h">
        <img src="media/10TH.jpg" class="card-img-top" alt="High School">
        <div class="card-body">
          <h4 class="card-title text-dark">High School (Grades 9–10)</h4>
          <p class="card-text">Rigorous curriculum preparing students for board exams, competitive tests, and future career opportunities.</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ✅ Teaching Methodology -->
<div class="card w-100 border-0 rounded-0">
  <div class="row g-0 align-items-stretch form-color-h">
    <div class="col-md-4 p-4">
      <img src="media/classroom.jpg" class="img-fluid h-100 w-100 object-fit-cover" alt="Our Teaching Methodology">
    </div>
    <div class="col-md-8 d-flex">
      <div class="card-body d-flex flex-column justify-content-center ms-5 p-4 w-100">
        <h3 class="card-title mb-3 ms-3 text-dark">Our Teaching Methodology</h3>
        <ul class="mb-0">
          <li>Interactive, student-centered classrooms</li>
          <li>Project-based and experiential learning</li>
          <li>Integration of technology and digital tools</li>
          <li>Regular assessments and personalized feedback</li>
          <li>Focus on life skills, leadership, and values</li>
        </ul>
      </div>
    </div>
  </div>
</div>




<!-- ✅ Stats -->
<div class="stats text-center">
  <div class="container-fluid">
    <div class="row g-4">
      <div class="col-md-3"><div class="stat-box"><h2>5000+</h2><p>Students</p></div></div>
      <div class="col-md-3"><div class="stat-box"><h2>200+</h2><p>Teachers</p></div></div>
      <div class="col-md-3"><div class="stat-box"><h2>50+</h2><p>Awards</p></div></div>
      <div class="col-md-3"><div class="stat-box"><h2>20+</h2><p>Years of Excellence</p></div></div>
    </div>
  </div>
</div>

<!-- ✅ Footer -->
<footer>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-4 text-center">
        <h5>About Edu Hub</h5>
        <p>Edu Hub Provides quality education in Pune, focusing on innovation, values, and holistic growth.</p>
      </div>
      <div class="col-md-4 text-center">
        <h5>Quick Links</h5>
        <ul class="list-unstyled">
          <li><a href="about.jsp" class="text-decoration-none footer-textcolor">About</a></li>
          <li><a href="index.jsp#admission" class="text-decoration-none footer-textcolor">Admissions</a></li>
          <li><a href="contact.jsp" class="text-decoration-none footer-textcolor">Contact</a></li>
        </ul>
      </div>
      <div class="col-md-4 text-center">
        <h5 class="ms-3">Reach us </h5>
        <p><i class="bi bi-envelope-fill me-2"></i> info@eduhub.com</p>
        <p><i class="bi bi-telephone-fill me-2"></i> +91 12345 67890</p>
        <p><i class="bi bi-geo-alt-fill me-2"></i> Pune, Maharashtra, India</p>
      </div>
    </div>
    <hr>
    <p class="text-center mb-0">&copy; 2025 EduHub. All Rights Reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
