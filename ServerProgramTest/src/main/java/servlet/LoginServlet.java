package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO mDao = new MemberDAO();
		boolean result = false;
		
		try {
			result = mDao.loginCheck(id, pw);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		
		if (result) {
			// main.jsp 로 이동
			session.setAttribute("loginId", id);
			String resultUrl = null;
			if (id.equals("admin")) {
				resultUrl = "admin.jsp";
			} else {
				resultUrl = "main.jsp";
			}
			RequestDispatcher rd = request.getRequestDispatcher(resultUrl);
			rd.forward(request, response);
		} else {
			// Login.jsp 로 이동
			session.setAttribute("loginId", "*");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
		
	}

}
