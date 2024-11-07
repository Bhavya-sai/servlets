<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Request" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome - Contact Messages</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f2f5;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    table {
        width: 100%;
        margin: 20px 0;
        border-collapse: collapse;
    }
    th, td {
        padding: 12px;
        text-align: left;
        border: 1px solid #ccc;
    }
    th {
        background-color: #007bff;
        color: #fff;
    }
    .btn {
        padding: 8px 16px;
        font-size: 14px;
        cursor: pointer;
        border-radius: 4px;
        border: none;
    }
    .btn-active {
        background-color: #28a745;
        color: white;
    }
    .btn-archive {
        background-color: #dc3545;
        color: white;
    }
    .message-status {
        text-align: center;
        font-weight: bold;
    }
    /* Fixed positioning for logout button */
    .logout-btn {
        position: fixed;
        top: 20px;
        right: 20px;
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        font-size: 14px;
        border-radius: 4px;
        border: none;
        cursor: pointer;
    }
</style>
</head>
<body>

<h1>Hello Admin!!</h1>

<!-- Logout button -->
<form action="logout" method="post">
    <button type="submit" class="logout-btn">Logout</button>
</form>

<h2>Active Requests</h2>
<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Full Name</th>
      <th>Email</th>
      <th>Message</th>
      <th>Submitted At</th>
      <th>Status</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
    <%
      List<Request> requests = (List<Request>) session.getAttribute("requests");
      if (requests != null) {
        for (Request req : requests) {
          if (req.getStatus().equals("active")) {
    %>
            <tr>
              <td><%= req.getId() %></td>
              <td><%= req.getName() %></td>
              <td><%= req.getEmail() %></td>
              <td><%= req.getMessage() %></td>
              <td><%= req.getSubmitedat() %></td>
              <td><%= req.getStatus() %></td>
              <td>
                <form action="archive" method="post">
                  <input type="hidden" name="id" value="<%= req.getId() %>">
                  <input type="hidden" name="action" value="archive">
                  <button type="submit" class="btn btn-archive">Archive</button>
                </form>
              </td>
            </tr>
    <%
          }
        }
      } else {
    %>
      <tr>
        <td colspan="7">No contact requests found.</td>
      </tr>
    <%
      }
    %>
  </tbody>
</table>

<h2>Archive Requests</h2>
<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Message</th>
      <th>Submitted At</th>
      <th>Status</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
    <%
      if (requests != null) {
        for (Request req : requests) {
          if (req.getStatus().equals("archive")) {
    %>
            <tr>
              <td><%= req.getId() %></td>
              <td><%= req.getName() %></td>
              <td><%= req.getEmail() %></td>
              <td><%= req.getMessage() %></td>
              <td><%= req.getSubmitedat() %></td>
              <td><%= req.getStatus() %></td>
              <td>
                <form action="active" method="post">
                  <input type="hidden" name="id" value="<%= req.getId() %>">
                  <input type="hidden" name="action" value="active">
                  <button type="submit" class="btn btn-active">Activate</button>
                </form>
              </td>
            </tr>
    <%
          }
        }
      } else {
    %>
      <tr>
        <td colspan="7">No archived requests found.</td>
      </tr>
    <%
      }
    %>
  </tbody>
</table>

</body>
</html>
