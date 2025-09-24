package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserRegistration extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Fetch form parameters
            String admission_date = request.getParameter("admission_date");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String father_name = request.getParameter("father_name");
            String mother_name = request.getParameter("mother_name");
            String dob = request.getParameter("dob");
            String aadhar_no = request.getParameter("aadhar_no");
            String parent_aadhar = request.getParameter("parent_aadhar");
            String phone = request.getParameter("phone");
            String contact_no = request.getParameter("contact_no");

            // Student-specific fields
            String ageStr = request.getParameter("age");
            int age = (ageStr != null && !ageStr.isEmpty()) ? Integer.parseInt(ageStr) : 0;
            String grade = request.getParameter("grade");
            String classIdStr = request.getParameter("class_id");
            Integer class_id = (classIdStr != null && !classIdStr.isEmpty()) ? Integer.parseInt(classIdStr) : null;

            // DB connection
            Connection connection = DBConnection.getConnection();

            // 1. Insert user WITHOUT admission_no first (role fixed as 'Student')
            String insertQuery = "INSERT INTO users (admission_date, name, father_name, mother_name, dob, "
                    + "aadhar_no, parent_aadhar, phone, email, password, contact_no, role, age, grade, class_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, admission_date);
            ps.setString(2, name);
            ps.setString(3, father_name);
            ps.setString(4, mother_name);
            ps.setString(5, dob);
            ps.setString(6, aadhar_no);
            ps.setString(7, parent_aadhar);
            ps.setString(8, phone);
            ps.setString(9, email);
            ps.setString(10, password);
            ps.setString(11, contact_no);
            ps.setString(12, "Student"); // role fixed
            ps.setInt(13, age);
            ps.setString(14, grade);
            if (class_id != null) {
                ps.setInt(15, class_id);
            } else {
                ps.setNull(15, java.sql.Types.INTEGER);
            }

            ps.executeUpdate();

            // 2. Get generated user_id
            ResultSet rs = ps.getGeneratedKeys();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt(1);
            }

            // 3. Generate admission_no (e.g., ADM00001)
            String admissionNo = "ADM" + String.format("%05d", userId);

            String updateQuery = "UPDATE users SET admission_no=? WHERE user_id=?";
            PreparedStatement ps2 = connection.prepareStatement(updateQuery);
            ps2.setString(1, admissionNo);
            ps2.setInt(2, userId);
            ps2.executeUpdate();

            rs.close();
            ps.close();
            ps2.close();
            connection.close();

            out.println("<h3>Registration Successful!</h3>");
            out.println("<p>User <strong>" + name + "</strong> has been registered.</p>");
            out.println("<p>Admission No: <strong>" + admissionNo + "</strong></p>");
            out.println("<a href='login.jsp'>Go to Login</a>");

        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
