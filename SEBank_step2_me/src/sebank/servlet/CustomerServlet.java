package sebank.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sebank.dao.CustomerDAO;

public class CustomerServlet extends HttpServlet {

	private static final long serialVersionUID = -4151534256947514145L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("join_form")) {
			request.getRequestDispatcher("join_form.jsp").forward(request, response);
		} else if (action.equals("login_form")) {

		} else if (action.equals("logout")) {

		} else if (action.equals("update_form")) {

		} else if (action.equals("check_id")) {
			String id = request.getParameter("id");
			if (!new CustomerDAO().check_id(id)) {
				request.setAttribute("custid", id);
			}
			request.getRequestDispatcher("check_id.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
