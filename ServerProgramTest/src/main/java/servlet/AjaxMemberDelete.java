package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/AjaxMemberDelete")
public class AjaxMemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("통신 들어옴.");
		
		String user_id = request.getParameter("user_id");
		
		// DAO 호출
		MemberDAO mDao = new MemberDAO();
		
		try {
			mDao.deleteMember(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
