<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edu Hub - Achievements</title>
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet">
	<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
	<link rel="stylesheet" href="css/Index.css">	
  </head>
  <body>

   <!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark nav-bg fixed-top ms-1 me-1">
  <div class="container">
    
    <!-- Brand Logo with Text -->
    <a class="navbar-brand d-flex align-items-center" href="Index.jsp">
      <img src="media/ed hub logo.png" alt="Edu Hub Logo" 
           width="60" height="60" class="d-inline-block me-2">
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
        <li class="nav-item"><a class="nav-link active" href="StudentLife.jsp">Student Life</a></li>
        <li class="nav-item"><a class="nav-link" href="Gallery.jsp">Gallery</a></li>
        <li class="nav-item"><a class="nav-link" href="Achievements.jsp">Achievements</a></li>
        <li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact</a></li>
      </ul>
    </div>
  </div>
</nav>


    <!-- ✅ Page Header -->
    <div class="page-header" style="background-image: url('media/school.jpg');">
      <h1>Student Life at Edu Hub</h1>
    </div>

    <!-- ✅ Intro Section -->
    <div class="form-color">
      <div class="container pt-5">
        <div class="text-center mb-5">
          <h2>Beyond Academics</h2>
          <p class="lead">At Edu Hub, we believe in nurturing not just minds but also talents, creativity, and leadership skills.</p>
        </div>
      </div>

      <!-- ✅ Activities Section -->
      <div class="container my-5">
        <div class="row g-4">
          <div class="col-md-4">
            <div class="card life-card">
              <img src="media/sport.jpg" class="card-img-top" alt="Sports">
              <div class="card-body form-color-h">
                <h5 class="card-title">Sports & Fitness</h5>
                <p class="card-text">From football to athletics, students participate in a wide range of sports fostering teamwork and discipline.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card life-card">
              <img src="media/culture_X-Design.jpg" class="card-img-top" alt="Cultural Events">
              <div class="card-body form-color-h">
                <h5 class="card-title">Cultural Activities</h5>
                <p class="card-text">Drama, music, dance, and festivals encourage cultural awareness and creativity among students.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card life-card">
              <img src="media/science club_X-Design.jpg" class="card-img-top" alt="Science Club">
              <div class="card-body form-color-h">
                <h5 class="card-title">Clubs & Societies</h5>
                <p class="card-text">Robotics, Science, Literature, and Eco Clubs give students opportunities to explore their passions.</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- ✅ Testimonials -->
      <div class="container">
        <h2 class="text-center mb-4">Student Testimonials</h2>
        <div class="row g-4">
          <div class="col-md-6">
            <div class="p-4 form-color-h rounded">
              <p>"Edu Hub gave me confidence through debate competitions and cultural events. It's truly a second home!"</p>
              <h6>- Priya Sharma, Grade 9</h6>
            </div>
          </div>
          <div class="col-md-6">
            <div class="p-4 form-color-h rounded">
              <p>"The sports facilities and supportive coaches helped me represent my school at state-level tournaments."</p>
              <h6>- Arjun Patel, Grade 8</h6>
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
