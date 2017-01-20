package sebank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sebank.vo.Customer;

public class CustomerDAO {

	public boolean check_id(String id) {
		boolean result = false;
		Connection con = ConnectionManager.getConnection();
		String sql = "select * from customer where custid = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			result = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			ConnectionManager.close(con);
		}
		return result;
	}

	public int insertCustomer(Customer c) {
		int result = 0;
		Connection con = ConnectionManager.getConnection();
		String sql = "insert into customer values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c.getCustid());
			pstmt.setString(2, c.getPassword());
			pstmt.setString(3, c.getName());
			pstmt.setString(4, c.getEmail());
			pstmt.setString(5, c.getDivision());
			pstmt.setString(6, c.getIdno());
			pstmt.setString(7, c.getAddress());
			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			ConnectionManager.close(con);
		}
		return result;
	}

	public Customer selectCustomer(String custid) {
		Customer customer = null;
		Connection con = ConnectionManager.getConnection();
		String sql = "select * from customer where custid = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				customer = new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
			}
			rs.close();
			pstmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			ConnectionManager.close(con);
		}
		return customer;
	}

	public int updateCustomer(Customer c) {
		int result = 0;
		Connection con = ConnectionManager.getConnection();
		String sql = "update customer set password = ?, name = ?, email = ?, address = ? where custid = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c.getPassword());
			pstmt.setString(2, c.getName());
			pstmt.setString(3, c.getEmail());
			pstmt.setString(4, c.getAddress());
			pstmt.setString(5, c.getCustid());
			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			ConnectionManager.close(con);
		}
		return result;
	}

}
