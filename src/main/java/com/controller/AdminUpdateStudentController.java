package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminUpdateStudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");

        if (userIdStr == null || userIdStr.isEmpty()) {
            response.sendRedirect("AdminStudentViewController");
            return;
        }

        try {
            int userId = Integer.parseInt(userIdStr);
            Map<String, Object> student = getStudentById(userId);

            if (student != null && !student.isEmpty()) {
                request.setAttribute("student", student);
                request.getRequestDispatcher("AdminUpdateStudent.jsp").forward(request, response);
            } else {
                response.sendRedirect("AdminStudentViewController?error=Student not found with ID: " + userId);
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("AdminStudentViewController?error=Invalid user ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminStudentViewController?error=Database error: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters from the form
            int userId = Integer.parseInt(request.getParameter("user_id"));
            String name = request.getParameter("name");
            String fatherName = request.getParameter("father_name");
            String motherName = request.getParameter("mother_name");
            String dob = request.getParameter("dob");
            String aadharNo = request.getParameter("aadhar_no");
            String parentAadhar = request.getParameter("parent_aadhar");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contactNo = request.getParameter("contact_no");
            String role = request.getParameter("role");
            int age = Integer.parseInt(request.getParameter("age"));
            String grade = request.getParameter("grade");
            int classId = Integer.parseInt(request.getParameter("class_id"));

            boolean success = updateStudent(userId, name, fatherName, motherName, dob, aadharNo, parentAadhar, phone,
                    address, email, password, contactNo, role, age, grade, classId);

            if (success) {
                response.sendRedirect("AdminStudentViewController?success=Student updated successfully");
            } else {
                response.sendRedirect("AdminUpdateStudentController?userId=" + userId + "&error=Failed to update student");
            }
        } catch (Exception e) {
            e.printStackTrace();
            String userId = request.getParameter("user_id");
            response.sendRedirect("AdminUpdateStudentController?userId=" + userId + "&error=Error: " + e.getMessage());
        }
    }

    private Map<String, Object> getStudentById(int userId) {
        Map<String, Object> student = new HashMap<>();
        String sql = "SELECT * FROM users WHERE user_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                student.put("user_id", resultSet.getInt("user_id"));
                student.put("admission_no", resultSet.getString("admission_no"));
                student.put("admission_date", resultSet.getDate("admission_date"));
                student.put("name", resultSet.getString("name"));
                student.put("father_name", resultSet.getString("father_name"));
                student.put("mother_name", resultSet.getString("mother_name"));
                student.put("dob", resultSet.getDate("dob"));
                student.put("aadhar_no", resultSet.getString("aadhar_no"));
                student.put("parent_aadhar", resultSet.getString("parent_aadhar"));
                student.put("phone", resultSet.getString("phone"));
                student.put("address", resultSet.getString("address"));
                student.put("email", resultSet.getString("email"));
                student.put("password", resultSet.getString("password"));
                student.put("contact_no", resultSet.getString("contact_no"));
                student.put("role", resultSet.getString("role"));
                student.put("age", resultSet.getInt("age"));
                student.put("grade", resultSet.getString("grade"));
                student.put("class_id", resultSet.getInt("class_id"));
                
                System.out.println("Student found: " + student.get("name"));
            } else {
                System.out.println("No student found with ID: " + userId);
            }

        } catch (SQLException e) {
            System.err.println("Database error in getStudentById: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Error in getStudentById: " + e.getMessage());
            e.printStackTrace();
        }

        return student;
    }

    private boolean updateStudent(int userId, String name, String fatherName, String motherName, String dob,
            String aadharNo, String parentAadhar, String phone, String address, String email, String password,
            String contactNo, String role, int age, String grade, int classId) {

        String sql = "UPDATE users SET name = ?, father_name = ?, mother_name = ?, dob = ?, "
                + "aadhar_no = ?, parent_aadhar = ?, phone = ?, address = ?, email = ?, "
                + "password = ?, contact_no = ?, role = ?, age = ?, grade = ?, class_id = ? "
                + "WHERE user_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, name);
            statement.setString(2, fatherName);
            statement.setString(3, motherName);
            statement.setString(4, dob);
            statement.setString(5, aadharNo);
            statement.setString(6, parentAadhar);
            statement.setString(7, phone);
            statement.setString(8, address);
            statement.setString(9, email);
            statement.setString(10, password);
            statement.setString(11, contactNo);
            statement.setString(12, "Student");
            statement.setInt(13, age);
            statement.setString(14, grade);
            statement.setInt(15, classId);
            statement.setInt(16, userId);

            int rowsAffected = statement.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Database error in updateStudent: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}