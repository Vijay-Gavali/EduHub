<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>EduHub - About</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="stylesheet" href="Index.css">

</head>
<body>


	<!-- ✅ Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-dark nav-bg fixed-top ms-1 me-1">
		<div class="container">

			<!-- Brand Logo with Text -->
			<a class="navbar-brand d-flex align-items-center" href="Index.jsp">
				<img src="/media/ed hub logo.png" alt="Edu Hub Logo" width="60"
				height="60" class="d-inline-block me-2"> EduHub
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse " id="navbarNav">
				<ul class="navbar-nav ms-auto nav-textcolor">
					<li class="nav-item"><a class="nav-link  " href="Index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link " href="About.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link "
						href="StudentLife.jsp">Student Life</a></li>
					<li class="nav-item"><a class="nav-link " href="Gallary.jsp">Gallery</a></li>
					<li class="nav-item"><a class="nav-link "
						href="Achievements.jsp">Achievements</a></li>
					<li class="nav-item"><a class="nav-link " href="Contact.Jsp">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- ✅ Leadership Section -->
	<div class="container-fluid form-color ">
		<h2 class="text-center mb-2">Leadership</h2>
		<div class="row">
			<div class="col-md-4 d-flex justify-content-center">
				<img src="/media/ceo.jpg" class=" img-fluid shadow pb-2"
					alt="Principal"
					style="height: 300px; width: 300px; object-fit: cover;">
			</div>
			<div class="col-md-8 d-flex align-items-center mb-5 ">
				<div>
					<h4>Principal’s Message</h4>
					<p>At Edu Hub, we believe in nurturing curiosity, creativity,
						and compassion. Our dedicated team of educators ensures that every
						student receives the right balance of academic rigor and personal
						growth opportunities.</p>
					<p>Together, we are shaping tomorrow’s leaders who will
						contribute positively to society and the world.</p>
				</div>
			</div>
		</div>
	</div>


	<!-- ✅ About Section -->
	<div class="container-fluid form-color-h ">
		<div class="row">
			<div class="col-md-6">
				<img src="/media/school.jpg" class="w-75 img-fluid"
					alt="Edu Hub Campus">
			</div>
			<div class="col-md-6 d-flex align-items-center ">
				<div>
					<h2>Who We Are</h2>
					<p>EduHub is a premier educational institution in Pune,
						dedicated to academic excellence and holistic development. Our
						goal is to create responsible global citizens through innovative
						teaching methods, state-of-the-art facilities, and value-based
						learning.</p>
					<p>Since our inception, we have been shaping young minds with a
						focus on creativity, leadership, and lifelong learning.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- ✅ Vision & Mission -->

	<div class="container-fluid form-color pt-5">
		<div class="container text-center">
			<h2 class=" form-color-h">Our Vision & Mission</h2>
			<div class="row">
				<div class="col-md-6 mb-4">
					<div class="p-5 form-color-h shadow rounded">
						<h4>Vision</h4>
						<p>To create a world-class education eco-system that empowers
							students with knowledge, skills, and values to become responsible
							global citizens.</p>
					</div>
				</div>
				<div class="col-md-6 mb-4">
					<div class="p-5 form-color-h shadow rounded">
						<h4>Mission</h4>
						<p>To provide holistic education that fosters academic
							excellence, innovation, and social responsibility while preparing
							students for lifelong success.</p>
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
					<p>Edu Hub Provides quality education in Pune, focusing on
						innovation, values, and holistic growth.</p>
				</div>
				<div class="col-md-4 text-center">
					<h5>Quick Links</h5>
					<ul class="list-unstyled  ">
						<li><a href="About.jsp"
							class="text-decoration-none footer-textcolor">About</a></li>
						<li><a href="Index.jsp#admission"
							class="text-decoration-none footer-textcolor">Admissions</a></li>
						<li><a href="Contact.jsp"
							class="text-decoration-none footer-textcolor">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-4  text-center">
					<h5 class="ms-3">Reach us</h5>
					<p>
						<i class="bi bi-envelope-fill me-2"></i> info@eduhub.com
					</p>
					<p>
						<i class="bi bi-telephone-fill me-2"></i> +91 12345 67890
					</p>
					<p>
						<i class="bi bi-geo-alt-fill me-2"></i> Pune, Maharashtra, India
					</p>

				</div>
			</div>
			<hr>
			<p class="text-center mb-0 ">&copy; 2025 EduHub. All Rights
				Reserved.</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
