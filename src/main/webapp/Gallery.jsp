<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edu Hub - Gallery</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/Index.css">
</head>
<body>

<!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark nav-bg fixed-top ms-1 me-1">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="Index.jsp">
      <img src="./media/ed hub logo.png" alt="Edu Hub Logo" width="60" height="60" class="d-inline-block me-2">
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
        <li class="nav-item"><a class="nav-link active" href="Gallery.jsp">Gallery</a></li>
        <li class="nav-item"><a class="nav-link" href="Achievements.jsp">Achievements</a></li>
        <li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact</a></li>

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
<div class="form-color-h">
  <div class="page-header" style="background-image: url('media/school.jpg');">
    <h1>Our Gallery</h1>
  </div>

  <!-- ✅ Gallery Grid -->
  <div class="container my-5">
    <div class="row g-4">
      <div class="col-md-4 col-sm-6">
        <img src="media/collegestudent.jpeg" class="img-fluid rounded gallery-img" alt="Gallery 1" data-bs-toggle="modal" data-bs-target="#galleryModal" data-bs-image="media/gallery1.jpg">
      </div>
      <div class="col-md-4 col-sm-6">
        <img src="media/collegestudent.jpeg" class="img-fluid rounded gallery-img" alt="Gallery 2" data-bs-toggle="modal" data-bs-target="#galleryModal" data-bs-image="media/gallery2.jpg">
      </div>
      <div class="col-md-4 col-sm-6">
        <img src="media/collegestudent.jpeg" class="img-fluid rounded gallery-img" alt="Gallery 3" data-bs-toggle="modal" data-bs-target="#galleryModal" data-bs-image="media/gallery3.jpg">
      </div>
      <div class="col-md-4 col-sm-6">
        <img src="media/collegestudent.jpeg" class="img-fluid rounded gallery-img" alt="Gallery 4" data-bs-toggle="modal" data-bs-target="#galleryModal" data-bs-image="media/gallery4.jpg">
      </div>
      <div class="col-md-4 col-sm-6">
        <img src="media/collegestudent.jpeg" class="img-fluid rounded gallery-img" alt="Gallery 5" data-bs-toggle="modal" data-bs-target="#galleryModal" data-bs-image="media/gallery5.jpg">
      </div>
      <div class="col-md-4 col-sm-6">
        <img src="media/collegestudent.jpeg" class="img-fluid rounded gallery-img" alt="Gallery 6" data-bs-toggle="modal" data-bs-target="#galleryModal" data-bs-image="media/gallery6.jpg">
      </div>
    </div>
  </div>

  <!-- ✅ Lightbox Modal -->
  <div class="modal fade" id="galleryModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
      <div class="modal-content bg-dark">
        <div class="modal-body text-center">
          <img src="" class="img-fluid rounded" id="modalImage" alt="Gallery Preview">
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
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // Modal image preview
  var galleryImages = document.querySelectorAll('.gallery-img');
  var modalImage = document.getElementById('modalImage');
  galleryImages.forEach(img => {
    img.addEventListener('click', function() {
      modalImage.src = this.dataset.bsImage;
    });
  });
</script>

</body>
</html>
