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

public class AdminStudentRegistration extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection connection = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;

        try {
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
            String grade = request.getParameter("grade");
            String address = request.getParameter("address");
            String class_id_str = request.getParameter("class_id");

            System.out.println("Received parameters:");
            System.out.println("class_id: " + class_id_str);
            System.out.println("name: " + name);
            System.out.println("email: " + email);

            if (class_id_str == null || class_id_str.isEmpty()) {
                request.setAttribute("message", "Please select a class for the student.");
                request.setAttribute("messageType", "error");
                RequestDispatcher rd = request.getRequestDispatcher("AdminStudentRegistration.jsp");
                rd.forward(request, response);
                return;
            }

            int class_id = Integer.parseInt(class_id_str);
            int age = (ageStr != null && !ageStr.isEmpty()) ? Integer.parseInt(ageStr) : 0;
            
            connection = DBConnection.getConnection();

            java.sql.Date admission_date = new java.sql.Date(System.currentTimeMillis());

            String insertQuery = "INSERT INTO users (admission_date, name, father_name, mother_name, dob, "
                    + "aadhar_no, parent_aadhar, phone,address, email, password, contact_no, role, age, grade, class_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?)";

            ps = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);

            ps.setDate(1, admission_date);
            ps.setString(2, name);
            ps.setString(3, father_name);
            ps.setString(4, mother_name);
            ps.setString(5, dob);
            ps.setString(6, aadhar_no);
            ps.setString(7, parent_aadhar);
            ps.setString(8, phone);
            ps.setString(9, address);
            ps.setString(10, email);
            ps.setString(11, password);
            ps.setString(12, contact_no);
            ps.setString(13, "Student");
            ps.setInt(14, age);
            ps.setString(15, grade);
            ps.setInt(16, class_id);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                rs = ps.getGeneratedKeys();
                int userId = 0;
                if (rs.next()) {
                    userId = rs.getInt(1);
                    
                    String admissionNo = "ADM" + String.format("%05d", userId);

                    String updateQuery = "UPDATE users SET admission_no = ? WHERE user_id = ?";
                    ps2 = connection.prepareStatement(updateQuery);
                    ps2.setString(1, admissionNo);
                    ps2.setInt(2, userId);
                    int updateResult = ps2.executeUpdate();
                    
                    if (updateResult > 0) {
                        request.setAttribute("message", "Registration Successful! Student " + name 
                            + " has been registered with Admission No: " + admissionNo);
                        request.setAttribute("messageType", "success");
                    } else {
                        request.setAttribute("message", "Student registered but admission number generation failed.");
                        request.setAttribute("messageType", "warning");
                    }
                }
            } else {
                request.setAttribute("message", "Registration failed: No rows affected");
                request.setAttribute("messageType", "error");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("message", "Invalid number format: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Registration failed: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (ps2 != null) ps2.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher("AdminStudentRegistration.jsp");
        rd.forward(request, response);
    }
}
