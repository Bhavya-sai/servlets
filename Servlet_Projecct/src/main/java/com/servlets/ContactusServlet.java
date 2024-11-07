package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.RequestDao;


@WebServlet("/contactus")
public class ContactusServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.getRequestDispatcher("contactus.jsp").forward(req, res);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String message = req.getParameter("message");
		try {
	        RequestDao.insertContactData(name, email, message);
	        res.sendRedirect("contactus");
	    } catch (Exception e) {
	        e.printStackTrace();
	        res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred during form submission.");
	    }
	}

}
