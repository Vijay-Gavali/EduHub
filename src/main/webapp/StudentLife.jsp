<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>EduHub - Student Life</title>
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

    <!-- ✅ Page Header -->
    <div class="page-header form-color-h" style="background-image: url('media/school.jpg');">
      <h1 class="text-center py-5 text-white">Student Life at Edu Hub</h1>
    </div>

    <!-- ✅ Activities Section -->
    <div class="form-color py-5">
      <div class="container">
        <div class="text-center mb-4">
          <h2>Activities & Clubs</h2>
          <p>EduHub encourages students to explore their talents and passions beyond classrooms.</p>
        </div>
        <div class="row g-4">
          <div class="col-md-3">
            <div class="card activity-card h-100">
              <img src="./media/sport.jpg" class="card-img-top" alt="Sports">
              <div class="card-body text-center form-color-h">
                <h5 class="card-title">Sports</h5>
                <p class="card-text">Cricket, Football, Basketball, Athletics & more.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card activity-card h-100">
              <img src="./media/culture_X-Design.jpg" class="card-img-top" alt="Arts & Culture">
              <div class="card-body text-center form-color-h">
                <h5 class="card-title">Arts & Culture</h5>
                <p class="card-text">Dance, Music, Drama, Painting, Cultural Fests.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card activity-card h-100">
              <img src="./media/science club_X-Design.jpg" class="card-img-top" alt="Clubs">
              <div class="card-body text-center form-color-h">
                <h5 class="card-title">Clubs</h5>
                <p class="card-text">Science Club, Debate Club, Literature, Coding & Robotics.</p>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card activity-card h-100">
              <img src="./anualday_X-Design.jpg" class="card-img-top" alt="Events">
              <div class="card-body text-center form-color-h">
                <h5 class="card-title">Events</h5>
                <p class="card-text">Annual Day, Science Fair, Cultural Fest, Competitions.</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- ✅ Campus Life -->
      <div class="container my-5">
        <div class="row align-items-center">
          <div class="col-md-6">
            <img src="./media/school.jpg" class="img-fluid rounded" alt="EduHub Campus Life">
          </div>
          <div class="col-md-6">
            <h2>Life on Campus</h2>
            <p>EduHub provides a safe, vibrant, and nurturing campus environment where students build friendships, collaborate in projects, and develop leadership skills. With modern classrooms, libraries, labs, and sports facilities, our campus is designed to create an inspiring atmosphere for learning and growth.</p>
          </div>
        </div>
      </div>

      <!-- ✅ Testimonials Carousel -->
      <div class="container form-color-h py-5">
        <h2 class="text-center mb-4">What Our Students Say</h2>
        <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active text-center">
              <blockquote class="blockquote">
                <p>"EduHub has given me opportunities to excel in both academics and sports!"</p>
                <footer class="blockquote-footer">Riya Sharma, Class 10</footer>
              </blockquote>
            </div>
            <div class="carousel-item text-center">
              <blockquote class="blockquote">
                <p>"The teachers here are supportive and the activities make learning fun."</p>
                <footer class="blockquote-footer">Arjun Patel, Class 8</footer>
              </blockquote>
            </div>
            <div class="carousel-item text-center">
              <blockquote class="blockquote">
                <p>"I love being part of the Coding Club and participating in inter-school competitions."</p>
                <footer class="blockquote-footer">Sneha Kulkarni, Class 9</footer>
              </blockquote>
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
          </button>
        </div>
      </div>
    </div>

    <!-- ✅ Footer -->
    <footer class="form-color py-4">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-4 text-center">
            <h5>About Edu Hub</h5>
            <p>EduHub provides quality education in Pune, focusing on innovation, values, and holistic growth.</p>
          </div>
          <div class="col-md-4 text-center">
            <h5>Quick Links</h5>
            <ul class="list-unstyled">
              <li><a href="About.jsp" class="text-decoration-none footer-textcolor">About</a></li>
              <li><a href="Index.jsp#admission" class="text-decoration-none footer-textcolor">Admissions</a></li>
              <li><a href="Contact.jsp" class="text-decoration-none footer-textcolor">Contact</a></li>
            </ul>
          </div>
          <div class="col-md-4 text-center">
            <h5 class="ms-3">Reach us</h5>
            <p><i class="bi bi-envelope-fill me-2"></i> info@eduhub.com</p>
            <p><i class="bi bi-telephone-fill me-2"></i> +91 12345 67890</p>
            <p><i class="bi bi-geo-alt-fill me-2"></i> Pune, Maharashtra, India</p>
          </div>
        </div>
        <hr>
        <p class="text-center mb-0">&copy; 2025 EduHub. All Rights Reserved.</p>
      </div>
    </footer>

    <!-- ✅ Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
