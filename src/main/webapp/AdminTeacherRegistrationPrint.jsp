<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Registration Receipt - EduHub</title>
    <link rel="stylesheet" type="text/css" href="css/AdminTeacherRegistrationPrint.css">
    <style>
        <%@include file="css/AdminTeacherRegistrationPrint.css"%>
    </style>
</head>
<body>
    <%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String contact_no = request.getParameter("contact_no");
    String class_id = request.getParameter("class_id");
    

    %>

    <div class="receipt-container">
        <div class="receipt-header">
            <div class="school-info">
                <h1>EduHub Academy</h1>
                <p>Premium Education Management System</p>
                <p>123 Education Street, Knowledge City, KC 12345</p>
                <p> +91 (555) 123-4567 | info@eduhub.edu</p>
            </div>
            <div class="receipt-title">
                <h2>Teacher Registration Confirmation</h2>
                <div class="receipt-badge">OFFICIAL RECEIPT</div>
            </div>
        </div>

        <!-- Receipt Details -->
        <div class="receipt-body">
            <div class="details-section">
                <h3>Registration Information</h3>
                <div class="details-grid">

                    <div class="detail-item">
                        <span class="detail-label">Registration Date:</span>
                        <span class="detail-value" id="currentDate"></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Status:</span>
                        <span class="status-badge active">Active</span>
                    </div>
                </div>
            </div>

            <div class="details-section">
                <h3> Teacher Details</h3>
                <div class="details-grid">
                    <div class="detail-item">
                        <span class="detail-label">Full Name:</span>
                        <span class="detail-value"><%= name %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Email Address:</span>
                        <span class="detail-value"><%= email %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Contact Number:</span>
                        <span class="detail-value"><%= contact_no %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Assigned Class:</span>
                        <span class="detail-value highlight">Class <%= class_id %></span>
                    </div>
                </div>
            </div>

            <div class="details-section">
                <h3> Login Credentials</h3>
                <div class="credentials-warning">
                     Please keep these credentials secure and confidential
                </div>
                <div class="details-grid">
                    <div class="detail-item">
                        <span class="detail-label"> Contact: </span>
                        <span class="detail-value credential"><%= contact_no %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Password:</span>
                        <span class="detail-value credential"><%= password %></span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Section -->
        <div class="receipt-footer">
            <div class="signature-section">
                <div class="signature-line"></div>
                <p>Authorized Signature</p>
            </div>
            
            <div class="important-notes">
                <h4> Important Notes:</h4>
                <ul>
                    <li>This document serves as official confirmation of teacher registration</li>
                    <li>Keep your login credentials secure and do not share with others</li>
                    <li>Contact administration for any changes or updates to your information</li>
                    <li>Use your credentials to access the EduHub portal</li>
                </ul>
            </div>

            <div class="footer-text">
                <p>Thank you for joining EduHub Academy! </p>
                <p>For assistance, contact: support@eduhub.edu | +1 (555) 123-HELP</p>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons">
            <button class="print-btn" onclick="window.print()">
                🖨 Print Receipt
            </button>
            <a href="AdminTeacherRegistration.jsp" class="new-registration-btn">
                ➕ New Registration
            </a>
        </div>
    </div>

    <script>
        document.getElementById('currentDate').textContent = new Date().toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });

        // Simple PDF download simulation
        function downloadAsPDF() {
            alert('PDF download functionality would be implemented here with a proper PDF library.');
            // In real implementation, you would use a library like jsPDF
            // window.print(); // Alternative: print as PDF
        }

        // Auto-print option (uncomment if needed)
        // window.onload = function() {
        //     window.print();
        // };
    </script>
</body>
</html>