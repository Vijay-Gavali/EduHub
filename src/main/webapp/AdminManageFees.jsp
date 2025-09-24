<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Fees</title>
<link rel="stylesheet" type="text/css" href="css/AdminManageFees.css">
    <style><%@include file="css/AdminManageFees.css"%></style>

</head>
<body>
<jsp:include page="./AdminDashboard.jsp"></jsp:include>

<div class="fees-container">
    <div class="fees-header">
        <h2>Manage Student Fees</h2>
    </div>

    <!-- Search Form -->
    <div class="search-container">
        <form method="get" action="AdminManageFeesController" class="search-form">
            <input type="text" name="studentId" placeholder="Enter Student ID"
                value="<%=request.getParameter("studentId") != null ? request.getParameter("studentId") : ""%>"
                class="search-input" required>
            <button type="submit" class="search-btn">Search</button>
        </form>
    </div>

    <!-- Messages -->
    <%
    String msg = (String) request.getAttribute("message");
    if (msg != null) {
        String msgClass = "info";
        if (msg.toLowerCase().contains("success"))
            msgClass = "success";
        else if (msg.toLowerCase().contains("error") || msg.toLowerCase().contains("invalid"))
            msgClass = "error";
    %>
    <div class="message <%=msgClass%>"><%=msg%></div>
    <%
    }
    %>

    <!-- Fees Table -->
    <%
    java.util.List<java.util.Map<String, String>> feesList = (java.util.List<java.util.Map<String, String>>) request
            .getAttribute("feesList");

    if (feesList != null && !feesList.isEmpty()) {
    %>
    <div class="table-container">
        <table class="fees-table">
            <thead>
                <tr>
                    <th>Fees ID</th>
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Total Fees</th>
                    <th>Paid Amount</th>
                    <th>Remaining Amount</th>
                    <th>Status</th>
                    <th>Payment Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (java.util.Map<String, String> fee : feesList) {
                    String statusClass = "";
                    if ("Paid".equalsIgnoreCase(fee.get("payment_status"))) {
                        statusClass = "status-paid";
                    } else if ("Pending".equalsIgnoreCase(fee.get("payment_status"))) {
                        statusClass = "status-pending";
                    } else {
                        statusClass = "status-overdue";
                    }
                %>
                <tr>
                    <td><%=fee.get("fees_id")%></td>
                    <td><%=fee.get("student_id")%></td>
                    <td><%=fee.get("student_name")%></td>
                    <td>₹<%=fee.get("amount")%></td>
                    <td>₹<%=fee.get("paid_amount")%></td>
                    <td>₹<%=fee.get("remaining_amount")%></td>
                    <td><span class="<%=statusClass%>"><%=fee.get("payment_status")%></span></td>
                    <td><%=fee.get("payment_date")%></td>
                    <td>
                        <%
                        if (!"Paid".equalsIgnoreCase(fee.get("payment_status"))) {
                        %>
                        <form method="post" action="AdminPayFeesController" class="payment-form">
                            <input type="hidden" name="feesId" value="<%=fee.get("fees_id")%>">
                            <input type="hidden" name="studentId" value="<%=fee.get("student_id")%>">
                            <input type="number" name="payAmount" placeholder="Amount" min="0.01"
                                max="<%=fee.get("remaining_amount")%>" step="0.01" class="payment-input" required>
                            <button type="submit" class="payment-btn">Pay</button>
                        </form>
                        <%
                        } else {
                        %>
                        <span class="fully-paid">Fully Paid</span>
                        <%
                        }
                        %>
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
    <%
    } else if (feesList != null && feesList.isEmpty()) {
    %>
    <div class="no-data">
        No fees records found for this student.
    </div>
    <%
    }
    %>
</div>
</body>
</html>