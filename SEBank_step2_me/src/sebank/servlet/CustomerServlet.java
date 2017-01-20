package sebank.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sebank.dao.CustomerDAO;
import sebank.vo.Customer;

public class CustomerServlet extends HttpServlet {

	private static final long serialVersionUID = -4151534256947514145L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		String action = request.getParameter("action");
		if (action.equals("join_form")) {
			request.getRequestDispatcher("join_form.jsp").forward(request, response);
		} else if (action.equals("join")) {
			String custid = request.getParameter("custid");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String division = request.getParameter("division");
			String idno = request.getParameter("idno");
			String address = request.getParameter("address");
			Customer customer = new Customer(custid, password, name, email, division, idno, address);
			int result = new CustomerDAO().insertCustomer(customer);
			if (result == 1) {
				request.setAttribute("isNotOK", "false");
				request.getRequestDispatcher("join_form.jsp").forward(request, response);
			} else {
				request.setAttribute("isNotOK", "true");
				request.getRequestDispatcher("join_form.jsp").forward(request, response);
			}
		} else if (action.equals("login_form")) {
			 request.getRequestDispatcher("login_form.jsp").forward(request, response);
			/*out.println(
					"<script>window.open('login_form.jsp', null, 'width=300, height=380, left=300, location=no, resizable=no');"
							+ "history.go(-1);</script>");*/
		} else if (action.equals("login")) {
			String custid = request.getParameter("custid");
			Customer c = new CustomerDAO().selectCustomer(custid);
			if (c != null) {
				request.getSession().setAttribute("custid", c.getCustid());
				out.println("<script>alert(\"success\");" + "location.href=\"index.jsp\";</script>"); 
			} else {
				out.println("<script>alert(\"fail...\");" + "history.go(-1);</script>");
			}
			/*String find_id = request.getParameter("custid");
			String find_password = request.getParameter("password");
			Customer find_customer = new CustomerDAO().selectCustomer(find_id, find_password);
			if (find_customer != null) {
				HttpSession session = request.getSession();
				session.setAttribute("custid", find_id);
				request.getRequestDispatcher("login_form.jsp").forward(request, response);
			} else {
				out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
			}*/
		} else if (action.equals("logout")) {
			request.getSession().removeAttribute("custid");
			request.getRequestDispatcher("index.jsp").forward(request, response);
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
