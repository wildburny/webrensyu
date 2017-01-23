package sebank.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sebank.dao.BoardDAO;
import sebank.vo.Board;

public class BoardServlet extends HttpServlet {

	private static final long serialVersionUID = -8976823064966099321L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String action = request.getParameter("action");

		if (action.equals("list")) {
			// 현재 페이지 값을 가져온다
			String paramPage = request.getParameter("page");
			int page = 1;
			try {
				page = Integer.parseInt(paramPage);
			} catch (Exception e) {
			}
			// 페이지당 글 갯수
			int count = 10;
			// 현재 페이지의 첫 게시글 번호
			int start = (page - 1) * count + 1;
			// 현재 페이지의 마지막 게시글 번호
			int end = start + count - 1;

			List<Board> list = new BoardDAO().list(start, end);
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			
			request.getRequestDispatcher("board_list.jsp").forward(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
