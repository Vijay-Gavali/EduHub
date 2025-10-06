<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration Receipt - EduHub</title>
    <link rel="stylesheet" type="text/css" href="css/AdminStudentRegistrationPrint.css">
    <style>
        <%@include file="css/AdminStudentRegistrationPrint.css"%>
    </style>
</head>
<body>
    <%
    // Fetch parameters from URL
    String admissionNo = request.getParameter("admission_no");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String fatherName = request.getParameter("father_name");
    String motherName = request.getParameter("mother_name");
    String dob = request.getParameter("dob");
    String aadharNo = request.getParameter("aadhar_no");
    String parentAadhar = request.getParameter("parent_aadhar");
    String phone = request.getParameter("phone");
    String contactNo = request.getParameter("contact_no");
    String age = request.getParameter("age");
    String grade = request.getParameter("grade");
    String address = request.getParameter("address");
    String classId = request.getParameter("class_id");
    
    %>

    <div class="receipt-container">
        <!-- Header Section -->
        <div class="receipt-header">
            <div class="school-info">
                <h1>EduHub Academy</h1>
                <p>Premium Education Management System</p>
                <p>123 Education Street, Knowledge City, KC 12345</p>
                <p>+1 (555) 123-4567 | 📧 info@eduhub.edu</p>
            </div>
            <div class="receipt-title">
                <h2>Student Registration Confirmation</h2>
                <div class="receipt-badge">OFFICIAL RECEIPT</div>
            </div>
        </div>

        <!-- Receipt Details -->
        <div class="receipt-body">
            <!-- Registration Information -->
            <div class="details-section">
                <h3>📋 Registration Information</h3>
                <div class="details-grid">
                    
                    <div class="detail-item">
                        <span class="detail-label">Admission Number:</span>
                        <span class="detail-value highlight"><%= admissionNo %></span>
                    </div>
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

            <!-- Student Personal Information -->
            <div class="details-section">
                <h3>👨‍🎓 Student Details</h3>
                <div class="details-grid">
                    <div class="detail-item">
                        <span class="detail-label">Full Name:</span>
                        <span class="detail-value"><%= name %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Date of Birth:</span>
                        <span class="detail-value"><%= dob %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Age:</span>
                        <span class="detail-value"><%= age %> years</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Aadhar Number:</span>
                        <span class="detail-value"><%= aadharNo %></span>
                    </div>
                </div>
            </div>

            <!-- Parent Information -->
            <div class="details-section">
                <h3>👨‍👩‍👧‍👦 Parent Information</h3>
                <div class="details-grid">
                    <div class="detail-item">
                        <span class="detail-label">Father's Name:</span>
                        <span class="detail-value"><%= fatherName %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Mother's Name:</span>
                        <span class="detail-value"><%= motherName %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Parent Aadhar:</span>
                        <span class="detail-value"><%= parentAadhar %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Parent Contact:</span>
                        <span class="detail-value"><%= contactNo %></span>
                    </div>
                </div>
            </div>

            <!-- Contact & Academic Information -->
            <div class="details-section">
                <h3>📞 Contact & Academic Details</h3>
                <div class="details-grid">
                    <div class="detail-item">
                        <span class="detail-label">Email Address:</span>
                        <span class="detail-value"><%= email %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Phone Number:</span>
                        <span class="detail-value"><%= phone %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Grade:</span>
                        <span class="detail-value"><%= grade %></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Assigned Class:</span>
                        <span class="detail-value highlight">Class <%= classId %></span>
                    </div>
                </div>
            </div>

            <!-- Address Information -->
            <div class="details-section">
                <h3>🏠 Address</h3>
                <div class="address-box">
                    <span class="detail-value"><%= address %></span>
                </div>
            </div>

            <!-- Login Credentials -->
            <div class="details-section">
                <h3>🔐 Login Credentials</h3>
                <div class="credentials-warning">
                    ⚠️ Please keep these credentials secure and confidential
                </div>
                <div class="details-grid">
                    <div class="detail-item">
                        <span class="detail-label">Phone no:</span>
                        <span class="detail-value credential"><%= phone %></span>
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
                <h4>📝 Important Notes:</h4>
                <ul>
                    <li>This document serves as official confirmation of student registration</li>
                    <li>Keep login credentials secure and do not share with others</li>
                    <li>Contact administration for any changes in information</li>
                    <li>Use credentials to access the EduHub student portal</li>
                    <li>Report lost credentials immediately to administration</li>
                </ul>
            </div>

            <div class="footer-text">
                <p>Welcome to EduHub Academy! We wish you success in your academic journey! 🎓</p>
                <p>For assistance, contact: support@eduhub.edu | +1 (555) 123-HELP</p>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons">
            <button class="print-btn" onclick="window.print()">
                🖨 Print Receipt
            </button>
            <a href="AdminStudentRegistration.jsp" class="new-registration-btn">
                ➕ New Registration
            </a>
        </div>
    </div>

    <script>
        // Set current date
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