package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.StringJoiner;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String identifier = request.getParameter("phone");
        String password = request.getParameter("password");

        try (Connection connection = DBConnection.getConnection()) {

            // ---------- 1) Try parent login ----------
            String parentQuery = "SELECT * FROM parent WHERE (phone = ? OR email = ?) AND password = ?";
            try (PreparedStatement psParent = connection.prepareStatement(parentQuery)) {
                psParent.setString(1, identifier);
                psParent.setString(2, identifier);
                psParent.setString(3, password);

                try (ResultSet rsParent = psParent.executeQuery()) {
                    if (rsParent.next()) {
                        HttpSession session = request.getSession();
                        int parentId = rsParent.getInt("parent_id");
                        String parentName = rsParent.getString("parent_name");
                        String parentPhone = rsParent.getString("phone");
                        String parentEmail = rsParent.getString("email");

                        session.setAttribute("parent_id", parentId);
                        session.setAttribute("name", parentName);
                        session.setAttribute("role", "Parent");
                        session.setAttribute("email", parentEmail);
                        session.setAttribute("phone", parentPhone);

                        // Fetch all children linked by contact_no = parent phone
                        String childQueryAll = "SELECT * FROM users WHERE contact_no = ?";
                        try (PreparedStatement psChildAll = connection.prepareStatement(childQueryAll)) {
                            psChildAll.setString(1, parentPhone);
                            try (ResultSet rsChildAll = psChildAll.executeQuery()) {
                                boolean first = true;
                                StringJoiner sj = new StringJoiner(", ");
                                int childCount = 0;

                                while (rsChildAll.next()) {
                                    childCount++;
                                    String childName = rsChildAll.getString("name");
                                    if (first) {
                                        // main child details for session (first record)
                                        session.setAttribute("studentName", childName);
                                        session.setAttribute("admission_no", rsChildAll.getString("admission_no"));
                                        session.setAttribute("admission_date", rsChildAll.getString("admission_date"));
                                        session.setAttribute("grade", rsChildAll.getString("grade"));
                                        session.setAttribute("user_id", rsChildAll.getInt("user_id")); // ✅ updated
                                        first = false;
                                    } else {
                                        sj.add(childName);
                                    }
                                }

                                if (childCount == 0) {
                                    // no linked child found
                                    session.removeAttribute("studentName");
                                    session.removeAttribute("admission_no");
                                    session.removeAttribute("admission_date");
                                    session.removeAttribute("grade");
                                    session.removeAttribute("user_id");
                                    session.setAttribute("childrenHtml", "<em>No linked student found</em>");
                                } else {
                                    // if there are additional children, expose them
                                    if (sj.length() > 0) {
                                        String extra = "<strong>Other children:</strong> " + sj.toString();
                                        session.setAttribute("childrenHtml", extra);
                                    } else {
                                        session.removeAttribute("childrenHtml");
                                    }
                                }
                            }
                        }

                        response.sendRedirect("UserDashboard.jsp");
                        return;
                    }
                }
            }

            // ---------- 2) Try users table ----------
            String userQuery = "SELECT * FROM users WHERE (phone = ? OR email = ? OR admission_no = ?) AND password = ?";
            try (PreparedStatement psUser = connection.prepareStatement(userQuery)) {
                psUser.setString(1, identifier);
                psUser.setString(2, identifier);
                psUser.setString(3, identifier);
                psUser.setString(4, password);

                try (ResultSet rsUser = psUser.executeQuery()) {
                    if (rsUser.next()) {
                        HttpSession session = request.getSession();
                        String role = rsUser.getString("role");
                        String userName = rsUser.getString("name");

                        session.setAttribute("user_id", rsUser.getInt("user_id")); // ✅ updated for users table
                        session.setAttribute("name", userName);
                        session.setAttribute("role", role);
                        session.setAttribute("admission_no", rsUser.getString("admission_no"));
                        session.setAttribute("admission_date", rsUser.getString("admission_date"));
                        session.setAttribute("grade", rsUser.getString("grade"));
                        session.setAttribute("email", rsUser.getString("email"));
                        session.setAttribute("phone", rsUser.getString("phone"));

                        // For students, place the studentName
                        if ("Student".equalsIgnoreCase(role)) {
                            session.setAttribute("studentName", userName);
                            session.removeAttribute("childrenHtml");
                        } else {
                            session.removeAttribute("studentName");
                            session.removeAttribute("childrenHtml");
                        }

                        // Redirect by role
                        if ("Admin".equalsIgnoreCase(role)) {
                            response.sendRedirect("AdminDashboard.jsp");
                        } else if ("Teacher".equalsIgnoreCase(role)) {
                            response.sendRedirect("TeacherDashboard.jsp");
                        } else {
                            response.sendRedirect("UserDashboard.jsp");
                        }
                        return;
                    }
                }
            }

            // ---------- 3) Invalid credentials ----------
            request.setAttribute("errorMessage", "Invalid phone/email/admission_no or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
