package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserFeesController extends HttpServlet {

    public static class FeeRecord {
        private String amount;
        private String dueDate;
        private String paymentStatus;
        private String paymentDate;

        public FeeRecord(String amount, String dueDate, String paymentStatus, String paymentDate) {
            this.amount = amount;
            this.dueDate = dueDate;
            this.paymentStatus = paymentStatus;
            this.paymentDate = paymentDate;
        }

        public String getAmount() { return amount; }
        public String getDueDate() { return dueDate; }
        public String getPaymentStatus() { return paymentStatus; }
        public String getPaymentDate() { return paymentDate; }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("user_id");
        List<FeeRecord> feesList = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection()) {
            String query = "SELECT amount, due_date, payment_status, payment_date FROM fees WHERE user_id = ? ORDER BY due_date DESC";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        feesList.add(new FeeRecord(
                                rs.getString("amount"),
                                rs.getString("due_date"),
                                rs.getString("payment_status"),
                                rs.getString("payment_date")
                        ));
                    }
                }
            }

            session.setAttribute("feesList", feesList);
            response.sendRedirect("UserDashboard.jsp?view=fees");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("feesList", null);
            response.sendRedirect("UserDashboard.jsp?view=fees");
        }
    }
}
