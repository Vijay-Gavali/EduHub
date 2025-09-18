package com.controller;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

import com.dbconnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminPayFeesController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String feesId = request.getParameter("feesId");
        String studentId = request.getParameter("studentId");
        String payAmountStr = request.getParameter("payAmount");
        String message = "";

        try (Connection con = DBConnection.getConnection()) {
            double payAmount = Double.parseDouble(payAmountStr);

            String selectSql = "SELECT amount, IFNULL(paid_amount,0) AS paid_amount, IFNULL(remaining_amount,amount) AS remaining_amount " +
                               "FROM fees WHERE fees_id=" + feesId;
            try (Statement st = con.createStatement();
                 ResultSet rs = st.executeQuery(selectSql)) {

                if (rs.next()) {
                    double totalAmount = rs.getDouble("amount");
                    double paidAmount = rs.getDouble("paid_amount");
                    double remainingAmount = rs.getDouble("remaining_amount");

                    if (payAmount > 0 && payAmount <= remainingAmount) {
                        double newPaid = paidAmount + payAmount;
                        double newRemaining = totalAmount - newPaid;
                        String status = (newRemaining <= 0) ? "Paid" : "Pending";

                        String updateSql = "UPDATE fees SET paid_amount=" + newPaid +
                                           ", remaining_amount=" + newRemaining +
                                           ", payment_status='" + status + "'" +
                                           ", payment_date='" + LocalDate.now() + "'" +
                                           " WHERE fees_id=" + feesId;
                        st.executeUpdate(updateSql);

                        message = "Payment successful!";
                    } else {
                        message = "Invalid payment amount.";
                    }
                } else {
                    message = "Fees record not found.";
                }
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }

        response.sendRedirect("AdminManageFeesController?studentId=" + studentId + "&msg=" + message);
    }
}
