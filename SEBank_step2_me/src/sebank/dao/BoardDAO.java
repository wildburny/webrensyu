package sebank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sebank.vo.Board;

public class BoardDAO {

	public static void main(String[] args) {
		BoardDAO dao = new BoardDAO();
		List<Board> list = dao.list(14, 20);
		System.out.println(list);
		System.out.println(list.size());
	}

	// 게시글 목록 가져오기
	public ArrayList<Board> list(int start, int end) {
		Connection con = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		ArrayList<Board> list = null;
		ResultSet rs = null;
		String sql = "Select * from" + " (Select rownum r, b.* from"
				+ " (Select boardnum, id, title, content, to_char(inputdate, 'yyyy/mm/dd') as inputdate, hits from board2) b)"
				+ " where r between ? and ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			list = new ArrayList<>();
			while (rs.next()) {
				int boardNum = rs.getInt("boardnum");
				String id = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String inputDate = rs.getString("inputdate");
				int hits = rs.getInt("hits");
				Board b = new Board(boardNum, id, title, content, inputDate, hits);
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(con);
		}
		return list;
	}
}