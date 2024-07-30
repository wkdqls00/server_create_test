package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.DBConnection;

public class PayDAO {
	public static void main(String[] args) {
		PayDAO pDao = new PayDAO();
		try {
			pDao.paymentAdd("YW", "Intro", 100000);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 구입 성공 DAO
	public void paymentAdd(String id, String subject, int point) throws SQLException {
		DBConnection d = new DBConnection(); // DBConnection 객체 생성
		Connection conn = d.getConnection();
		
		String sql = "INSERT INTO payment(id, subject) VALUES(?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, subject);
		
		int result = pstmt.executeUpdate();
		
		String pointsql = "UPDATE member SET point = point - ? WHERE id = ?";
		
		PreparedStatement pstmt1 = conn.prepareStatement(pointsql);
		
		pstmt1.setInt(1, point);
		pstmt1.setString(2, id);
		
		int result1 = pstmt1.executeUpdate();
		
		System.out.println(result + "행 구입 성공 업데이트.");
		
		pstmt1.close();
		pstmt.close();
		conn.close();
	}
	
	// 포인트 증가 DAO
	public void pointPlus(int point, String id) throws SQLException {
		DBConnection d = new DBConnection(); // DBConnection 객체 생성
		Connection conn = d.getConnection();
		
		String sql = "UPDATE MEMBER "
				+ "SET point = point + ? "
				+ "WHERE id = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, point);
		pstmt.setString(2, id);
		
		int result = pstmt.executeUpdate();
		System.out.println(result + "행 포인트 증가 업데이트.");
		
		pstmt.close();
		conn.close();
		
	}
}
