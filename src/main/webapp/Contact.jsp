<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edu Hub - Contact</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/Index.css">
</head>
<body>

<!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark nav-bg fixed-top ms-1 me-1">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="Index.jsp">
      <img src="media/ed hub logo.png" alt="Edu Hub Logo" width="60" height="60" class="d-inline-block me-2">
      Edu Hub
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
        <li class="nav-item"><a class="nav-link" href="StudentLife.jsp">Student Life</a></li>
        <li class="nav-item"><a class="nav-link" href="Gallery.jsp">Gallery</a></li>
        <li class="nav-item"><a class="nav-link" href="Achievements.jsp">Achievements</a></li>
        <li class="nav-item"><a class="nav-link active" href="Contact.jsp">Contact</a></li>

        <% if (role != null) { %>
            <li class="nav-item">
                <% if ("Admin".equalsIgnoreCase(role)) { %>
                    <a class="nav-link btn btn-outline-warning ms-2 px-3 py-1 rounded" href="AdminDashboard.jsp">Dashboard</a>
                <% } else if ("Teacher".equalsIgnoreCase(role)) { %>
                    <a class="nav-link btn btn-outline-info ms-2 px-3 py-1 rounded" href="TeacherDashboard.jsp">Dashboard</a>
                <% } else { %>
                    <a class="nav-link btn btn-outline-success ms-2 px-3 py-1 rounded" href="UserDashboard.jsp">Dashboard</a>
                <% } %>
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-danger ms-2 px-3 py-1 rounded" href="logout.jsp">Logout</a>
            </li>
        <% } else { %>
            <li class="nav-item">
                <a class="nav-link btn btn-outline-light ms-2 px-3 py-1 rounded" href="login.jsp">Login</a>
            </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>

<!-- ✅ Page Header -->
<div class="page-header" style="background-image: url('media/school.jpg');">
  <h1>Contact Us</h1>
</div>

<!-- ✅ Contact Info + Form -->
<div class="form-color">
  <div class="container form-color-h">
    <div class="row g-4">
      <!-- Contact Info -->
      <div class="col-md-5">
        <h3>Get in Touch</h3>
        <p>We’d love to hear from you. Please reach out through any of the channels below.</p>
        <ul class="list-unstyled">
          <li><strong>Address:</strong> Edu Hub School, Pune, Maharashtra, India</li>
          <li><strong>Phone:</strong> +91 98765 43210</li>
          <li><strong>Email:</strong> info@eduhub.com</li>
          <li><strong>Working Hours:</strong> Mon - Sat, 8:00 AM - 5:00 PM</li>
        </ul>
      </div>

      <!-- Contact Form -->
      <div class="col-md-7 form-color-h">
        <h3>Send Us a Message</h3>
        <form>
          <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-control" placeholder="Enter your name">
          </div>
          <div class="mb-3">
            <label class="form-label">Email Address</label>
            <input type="email" class="form-control" placeholder="Enter your email">
          </div>
          <div class="mb-3">
            <label class="form-label">Subject</label>
            <input type="text" class="form-control" placeholder="Subject of your message">
          </div>
          <div class="mb-3">
            <label class="form-label">Message</label>
            <textarea class="form-control" rows="5" placeholder="Type your message here..."></textarea>
          </div>
          <button type="submit" class="btn btn-success">Send Message</button>
        </form>
      </div>
    </div>
  </div>

  <!-- ✅ Google Map -->
  <div class="container mt-5">
    <h3 class="text-center mb-3">Find Us on Map</h3>
    <div class="ratio ratio-16x9">
      <iframe 
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3783.3459939334583!2d73.8567438148923!3d18.52043008740485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c062f6d1f0af%3A0xf8d9a90c5a5f9c0!2sPune%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1694440000000" 
        style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
      </iframe>
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
