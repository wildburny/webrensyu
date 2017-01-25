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
import sebank.vo.Reply;

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
			int numOfContent = new BoardDAO().getNumberOfContent();

			if (end > numOfContent) {
				request.setAttribute("isOver", "true");
			} else {
				request.setAttribute("isOver", "false");
			}
			request.setAttribute("list", list);
			request.setAttribute("page", page);

			request.getRequestDispatcher("board_list.jsp").forward(request, response);

		} else if (action.equals("writeForm")) {
			request.getRequestDispatcher("boardWriteForm.jsp").forward(request, response);
		} else if (action.equals("write")) {
			String id = (String) request.getSession().getAttribute("custid");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Board b = new Board(0, id, title, content, null, 0);
			if (new BoardDAO().write(b) != 0) {
				out.println("<script>alert('글쓰기 성공!');" + "location.href='BoardServlet?action=list';" + "</script>");
			} else {
				out.println("<script>alert('글쓰기 실패!');" + "history.go(-1);" + "</script>");
			}
		} else if (action.equals("read")) {
			String num = request.getParameter("boardNum");
			int boardNum = Integer.parseInt(num);
			BoardDAO dao = new BoardDAO();
			// 조회수 증가
			dao.addHits(boardNum);
			// 글 읽어오기
			Board b = dao.read(boardNum);
			// 리플 리스트 가져오기
			List<Reply> reList = dao.replyList(boardNum);

			request.setAttribute("reList", reList);
			request.setAttribute("board", b);
			request.getRequestDispatcher("boardRead.jsp").forward(request, response);
		} else if (action.equals("delete")) {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			if (new BoardDAO().delete(boardNum) != 0) {
				response.sendRedirect("BoardServlet?action=list");
			} else {
				response.sendRedirect("BoardServlet?action=list");
			}
		} else if (action.equals("updateForm")) {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			Board b = new BoardDAO().read(boardNum);
			request.setAttribute("board", b);
			request.getRequestDispatcher("boardUpdateForm.jsp").forward(request, response);
		} else if (action.equals("update")) {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Board b = new Board(boardNum, null, title, content, null, 0);
			if (new BoardDAO().update(b) != 0) {
				response.sendRedirect("BoardServlet?action=list");
			} else {
				response.sendRedirect("BoardServlet?action=list");
			}
		} else if (action.equals("replyDelete")) {
			int replyNum = Integer.parseInt(request.getParameter("replyNum"));
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			if (new BoardDAO().deleteReply(replyNum) != 0) {
				out.println("<script>alert('댓글 삭제 성공!'); location.href='BoardServlet?action=read&boardNum=" + boardNum
						+ "';" + "</script>");
			} else {
				out.println("<script>alert('댓글 삭제 실패!'); location.href='BoardServlet?action=read&boardNum=" + boardNum
						+ "';" + "</script>");
			}
		} else if (action.equals("insertReply")) {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			String id = request.getParameter("id");
			String text = request.getParameter("text");
			Reply r = new Reply(0, boardNum, id, text, null);
			if (new BoardDAO().insertReply(r) != 0) {
				out.println("<script>alert('댓글 등록 성공!'); location.href='BoardServlet?action=read&boardNum=" + boardNum
						+ "';" + "</script>");
			} else {
				out.println("<script>alert('댓글 등록 실패!'); location.href='BoardServlet?action=read&boardNum=" + boardNum
						+ "';" + "</script>");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
