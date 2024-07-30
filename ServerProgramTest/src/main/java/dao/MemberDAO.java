package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.*;
import dto.MemberInfoAdminDTO;
import dto.MemberInfoDTO;
import dto.MemberListDTO;

// 회원 관련 DAO
public class MemberDAO {
	
	public static void main(String[] args) {
		MemberDAO mDao = new MemberDAO();
		try {
			// mDao.registerMember("jyw0128", "1010", "장익빈");
			mDao.deleteMember("hello123");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 회원가입 DAO
	public void registerMember (String id, String pw, String name) throws SQLException {
		DBConnection d = new DBConnection(); // DBConnection 객체 생성
		Connection conn = d.getConnection();
		
		String sql = "INSERT INTO MEMBER(ID, PW, NAME, POINT) VALUES(?, ?, ?, DEFAULT)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		
		int result = pstmt.executeUpdate();
		System.out.println(result + "행 회원가입 업데이트 성공.");
		
		pstmt.close();
		conn.close();
		
	}
	
	// 로그인 확인 DAO
	public boolean loginCheck(String id, String pw) throws SQLException {
		DBConnection d = new DBConnection();
		Connection conn = d.getConnection();
		
		String sql = "SELECT COUNT(*) "
				+ "FROM member "
				+ "WHERE id = ? "
				+ "AND pw = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result == 1;
	}
	
	// 회원 정보 출력
	public MemberInfoDTO selectMemberInfoDTO(String id) throws SQLException {
		
		DBConnection d = new DBConnection();
		Connection conn = d.getConnection();
		
		String sql = "SELECT name, point "
				+ "FROM member "
				+ "WHERE id = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);

        ResultSet rs = pstmt.executeQuery();
        MemberInfoDTO memberInfoDTO = null;
		
        while(rs.next()) {
        	String name = rs.getString(1);
        	int point = rs.getInt(2);
        	
        	memberInfoDTO = new MemberInfoDTO(name, point);
        }
        
        return memberInfoDTO;
	}
	
	// 회원 목록 출력
	public ArrayList<MemberListDTO> selectMemberListDTO() throws SQLException {
		ArrayList<MemberListDTO> list = new ArrayList<>();
		
		DBConnection d = new DBConnection();
		Connection conn = d.getConnection();
		
		String sql = "SELECT id, pw, name, point "
				+ "FROM member";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			int point = rs.getInt(4);
			
			MemberListDTO dto = new MemberListDTO(id, pw, name, point);
			list.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return list;
	}
	
	// 회원 삭제 DAO
	public void deleteMember(String id) throws SQLException {
		DBConnection d = new DBConnection(); // DBConnection 객체 생성
		Connection conn = d.getConnection();
		
		String sql = "DELETE "
				+ "FROM member "
				+ "WHERE id = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		int result = pstmt.executeUpdate();
		System.out.println(result + "행 회원 삭제 업데이트 성공.");
		
		pstmt.close();
		conn.close();
		
	}

	// 회원 정보 (관리자용) 출력 DAO
	public MemberInfoAdminDTO selectMemberInfoAdminDTO(String id) throws SQLException {
		DBConnection d = new DBConnection();
		Connection conn = d.getConnection();
		
		String sql = "SELECT id, name, pw, point "
				+ "FROM member "
				+ "WHERE id = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);

        ResultSet rs = pstmt.executeQuery();
        MemberInfoAdminDTO MemberInfoAdminDTO = null;
		
        while(rs.next()) {
        	String user_id = rs.getString(1);
        	String name = rs.getString(2);
        	String pw = rs.getString(3);
        	int point = rs.getInt(4);
        	
        	MemberInfoAdminDTO = new MemberInfoAdminDTO(user_id, name, pw, point);
        }
        
        return MemberInfoAdminDTO;
	}
	
	// 회원 정보 수정
	public void modifyUpdate (String id, String pw, String name, int point) throws SQLException {
		DBConnection d = new DBConnection(); // DBConnection 객체 생성
		Connection conn = d.getConnection();
		
		String sql = "UPDATE member "
				+ "SET pw = ?, name = ?, point = ? "
				+ "WHERE id = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, pw);
		pstmt.setInt(3, point);
		pstmt.setString(4, id);
		
		int result = pstmt.executeUpdate();
		System.out.println(result + "행 회원정보 업데이트 성공.");
		
		pstmt.close();
		conn.close();
		
	}
}
