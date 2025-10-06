<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edu Hub - Achievements</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/Index.css">
  </head>
  <body>

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

    <!-- ✅ Page Header -->
    <div class="banner" style="background-image: url('media/school.jpg'); background-size: cover; background-position: center; height: 70vh; display: flex; align-items: center; justify-content: center; color: white; text-shadow: 2px 2px 5px rgba(0,0,0,0.7);">
  <div class="text-center">
    <h1>Achievements</h1>
  </div>
</div>

    <!-- ✅ Achievements Section -->
    <div class="form-color">
  <div class="container pt-5">
    <div class="text-center mb-5">
      <h2>Our Students Shine</h2>
      <p class="lead">Edu Hub celebrates academic, sports, and extracurricular achievements of our students.</p>
    </div>

    <div class="row g-4 align-items-stretch">
      <!-- Academic Excellence -->
      <div class="col-md-4">
        <div class="card life-card h-100">
          <img src="media/academicsachievement.jpg" class="card-img-top" alt="Academic Awards">
          <div class="card-body form-color-h d-flex flex-column">
            <h5 class="card-title">Academic Excellence</h5>
            <p class="card-text">Students consistently excel in state and national level competitions, showcasing their academic brilliance.</p>
          </div>
        </div>
      </div>

      <!-- Sports Achievements -->
      <div class="col-md-4">
        <div class="card life-card h-100">
          <img src="media/sportachievement.jpg" class="card-img-top" alt="Sports Achievements">
          <div class="card-body form-color-h d-flex flex-column">
            <h5 class="card-title">Sports Achievements</h5>
            <p class="card-text">Our athletes bring laurels in inter-school and state-level tournaments, promoting sportsmanship and discipline.</p>
          </div>
        </div>
      </div>

      <!-- Cultural Awards -->
      <div class="col-md-4">
        <div class="card life-card h-100">
          <img src="media/culturalachievement.jpg" class="card-img-top" alt="Cultural Awards">
          <div class="card-body form-color-h d-flex flex-column">
            <h5 class="card-title">Cultural Awards</h5>
            <p class="card-text">Students excel in music, drama, and cultural events, reflecting creativity and talent.</p>
          </div>
        </div>
      </div>
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
        <p class="text-center mb-0">&copy; 2025 Edu Hub. All Rights Reserved.</p>
      </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
