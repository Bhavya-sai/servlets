package com.servlets;

import java.io.IOException;
import java.util.List;

import com.dao.RequestDao;
import com.model.Request;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({ "/dashboard", "/archive", "/active" })
public class DashboardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		if (request.getSession().getAttribute("activeUser") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		HttpSession session = request.getSession();
		List<Request> requests = RequestDao.getRequestsData();
		
		session.setAttribute("requests", requests);
		try {
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));

		if ("archive".equals(action)) {
			RequestDao.updateStatus(id, "archive");
		} else {
			RequestDao.updateStatus(id, "active");
		}
		try {
			response.sendRedirect("dashboard");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}