package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UserDao;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet 
{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException {
		try {
			req.getRequestDispatcher("login.jsp").forward(req, res);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		PrintWriter out = response.getWriter();

		User loginData = new User(email,password);
		if (UserDao.getData(loginData.getEmail(), loginData.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("activeUser", email);
			response.sendRedirect("dashboard");
		} else {
			out.println("Invalid credentials please try again");
		}

	}
	
}