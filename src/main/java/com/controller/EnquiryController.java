package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EnquiryController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read form inputs
        String parentName = request.getParameter("parent_name");
        String contactNo = request.getParameter("contact_no");
        String enquiryMessage = request.getParameter("enquiry_message");

        // Basic server-side validation
        if (parentName == null || parentName.trim().isEmpty() ||
            contactNo == null || contactNo.trim().isEmpty() ||
            enquiryMessage == null || enquiryMessage.trim().isEmpty()) {

            response.sendRedirect("Contact.jsp?error=Please+fill+all+fields");
            return;
        }

        String sql = "INSERT INTO enquiry (parent_name, contact_no, enquiry_date, enquiry_message) VALUES (?, ?, CURDATE(), ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, parentName);
            ps.setString(2, contactNo);
            ps.setString(3, enquiryMessage);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("Contact.jsp?success=Enquiry+submitted+successfully!");
            } else {
                response.sendRedirect("Contact.jsp?error=Failed+to+submit+enquiry");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Contact.jsp?error=Something+went+wrong.+Try+again");
        }
    }
}
