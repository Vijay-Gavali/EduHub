package com.controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import com.dbconnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminManageFeesController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentId = request.getParameter("studentId");
        List<Map<String, String>> feesList = new ArrayList<>();

        if (studentId == null || studentId.trim().isEmpty()) {
            request.setAttribute("message", "Please enter a valid Student ID");
            request.getRequestDispatcher("AdminManageFees.jsp").forward(request, response);
            return;
        }

        try (Connection con = DBConnection.getConnection()) {

            // Step 1: Check fees table
            String checkFees = "SELECT f.fees_id, f.user_id, u.name AS student_name, " +
                               "f.amount, f.paid_amount, f.remaining_amount, f.payment_status, f.payment_date " +
                               "FROM fees f JOIN users u ON f.user_id = u.user_id " +
                               "WHERE f.user_id = ?";
            try (PreparedStatement ps = con.prepareStatement(checkFees)) {
                ps.setInt(1, Integer.parseInt(studentId));
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    Map<String, String> fee = new HashMap<>();
                    fee.put("fees_id", String.valueOf(rs.getInt("fees_id")));
                    fee.put("user_id", String.valueOf(rs.getInt("user_id")));
                    fee.put("student_name", rs.getString("student_name"));
                    fee.put("amount", String.format("%.2f", rs.getBigDecimal("amount")));
                    fee.put("paid_amount", String.format("%.2f", rs.getBigDecimal("paid_amount")));
                    fee.put("remaining_amount", String.format("%.2f", rs.getBigDecimal("remaining_amount")));
                    fee.put("payment_status", rs.getString("payment_status"));
                    fee.put("payment_date", rs.getDate("payment_date") != null ?
                            rs.getDate("payment_date").toString() : "Not Paid");
                    feesList.add(fee);
                } else {
                    // Step 2: If no record in fees → fetch from users & class
                    String fetchStudent = "SELECT u.user_id, u.name, c.fees " +
                                          "FROM users u JOIN class c ON u.class_id = c.class_id " +
                                          "WHERE u.user_id = ?";
                    try (PreparedStatement ps2 = con.prepareStatement(fetchStudent)) {
                        ps2.setInt(1, Integer.parseInt(studentId));
                        ResultSet rs2 = ps2.executeQuery();

                        if (rs2.next()) {
                            int uid = rs2.getInt("user_id");
                            String name = rs2.getString("name");
                            double totalFees = rs2.getDouble("fees");

                            // Insert into fees table
                            String insertFees = "INSERT INTO fees (user_id, amount, paid_amount, remaining_amount, payment_status) " +
                                                "VALUES (?, ?, 0, ?, 'Pending')";
                            try (PreparedStatement ps3 = con.prepareStatement(insertFees, Statement.RETURN_GENERATED_KEYS)) {
                                ps3.setInt(1, uid);
                                ps3.setDouble(2, totalFees);
                                ps3.setDouble(3, totalFees);
                                ps3.executeUpdate();

                                ResultSet genKeys = ps3.getGeneratedKeys();
                                int feesId = 0;
                                if (genKeys.next()) {
                                    feesId = genKeys.getInt(1);
                                }

                                Map<String, String> fee = new HashMap<>();
                                fee.put("fees_id", String.valueOf(feesId));
                                fee.put("user_id", String.valueOf(uid));
                                fee.put("student_name", name);
                                fee.put("amount", String.format("%.2f", totalFees));
                                fee.put("paid_amount", "0.00");
                                fee.put("remaining_amount", String.format("%.2f", totalFees));
                                fee.put("payment_status", "Pending");
                                fee.put("payment_date", "Not Paid");
                                feesList.add(fee);
                            }
                        } else {
                            request.setAttribute("message", "Student not found with ID: " + studentId);
                        }
                    }
                }
                rs.close();
            }

            request.setAttribute("feesList", feesList);

        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }

        request.getRequestDispatcher("AdminManageFees.jsp").forward(request, response);
    }
}
