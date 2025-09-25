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
import jakarta.servlet.RequestDispatcher;

public class UserRegistration extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
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

            String ageStr = request.getParameter("age");
            int age = (ageStr != null && !ageStr.isEmpty()) ? Integer.parseInt(ageStr) : 0;
            String grade = request.getParameter("grade");
            String classIdStr = request.getParameter("class_id");
            Integer class_id = (classIdStr != null && !classIdStr.isEmpty()) ? Integer.parseInt(classIdStr) : null;

            Connection connection = DBConnection.getConnection();

            String insertQuery = "INSERT INTO users (admission_date, name, father_name, mother_name, dob, "
                    + "aadhar_no, parent_aadhar, phone, email, password, contact_no, role, age, grade, class_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Student', ?, ?, ?)";

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
            ps.setInt(12, age);
            ps.setString(13, grade);
            if (class_id != null) {
                ps.setInt(14, class_id);
            } else {
                ps.setNull(14, java.sql.Types.INTEGER);
            }

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                int userId = 0;
                if (rs.next()) {
                    userId = rs.getInt(1);
                }

                String admissionNo = "ADM" + String.format("%05d", userId);

                String updateQuery = "UPDATE users SET admission_no=? WHERE user_id=?";
                PreparedStatement ps2 = connection.prepareStatement(updateQuery);
                ps2.setString(1, admissionNo);
                ps2.setInt(2, userId);
                ps2.executeUpdate();

                rs.close();
                ps2.close();
                
                request.setAttribute("message", "Registration Successful! Student " + name + " has been registered with Admission No: " + admissionNo);
                request.setAttribute("messageType", "success");
            }

            ps.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Registration failed: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("userRegistration.jsp");
        rd.forward(request, response);
    }
}