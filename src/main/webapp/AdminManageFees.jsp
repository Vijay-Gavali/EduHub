<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Fees</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 20px;
}

.container {
	max-width: 1000px;
	margin: 0 auto;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 25px;
}

.search-form {
	text-align: center;
	margin-bottom: 25px;
	padding: 15px;
	background-color: #f9f9f9;
	border-radius: 6px;
}

.search-form input[type="text"] {
	padding: 10px;
	width: 250px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
}

.search-form input[type="submit"] {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	margin-left: 10px;
}

.search-form input[type="submit"]:hover {
	background-color: #45a049;
}

.message {
	padding: 10px;
	margin: 15px 0;
	border-radius: 4px;
	text-align: center;
}

.success {
	background-color: #dff2d8;
	color: #4F8A10;
	border: 1px solid #D6E9C6;
}

.error {
	background-color: #ffd2d2;
	color: #D8000C;
	border: 1px solid #FFBABA;
}

.info {
	background-color: #d9edf7;
	color: #31708f;
	border: 1px solid #bce8f1;
}

table {
	border-collapse: collapse;
	width: 100%;
	margin: 10px 0;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: center;
}

th {
	background-color: #4CAF50;
	color: white;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #e9f7e9;
}

.payment-form {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 8px;
}

.payment-form input[type="number"] {
	padding: 6px;
	width: 100px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.payment-form input[type="submit"] {
	padding: 6px 12px;
	background-color: #2196F3;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.payment-form input[type="submit"]:hover {
	background-color: #0b7dda;
}

.status-paid {
	color: #4CAF50;
	font-weight: bold;
}

.status-pending {
	color: #FF9800;
	font-weight: bold;
}

.status-overdue {
	color: #f44336;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Manage Student Fees</h2>

		<!-- Search Form -->
		<form method="get" action="AdminManageFeesController"
			class="search-form">
			<input type="text" name="studentId" placeholder="Enter Student ID"
				value="<%=request.getParameter("studentId") != null ? request.getParameter("studentId") : ""%>"
				required> <input type="submit" value="Search">
		</form>

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
		<table>
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
				<td class="<%=statusClass%>"><%=fee.get("payment_status")%></td>
				<td><%=fee.get("payment_date")%></td>
				<td>
					<%
					if (!"Paid".equalsIgnoreCase(fee.get("payment_status"))) {
					%>
					<form method="post" action="AdminPayFeesController"
						class="payment-form">
						<input type="hidden" name="feesId"
							value="<%=fee.get("fees_id")%>"> <input type="hidden"
							name="studentId" value="<%=fee.get("student_id")%>"> <input
							type="number" name="payAmount" placeholder="Amount" min="0.01"
							max="<%=fee.get("remaining_amount")%>" step="0.01" required>
						<input type="submit" value="Pay">
					</form> <%
 } else {
 %> <span class="status-paid">Fully Paid</span> <%
 }
 %>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		}
		%>
	</div>
</body>
</html>
