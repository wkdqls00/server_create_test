package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PayDAO;

@WebServlet("/AjaxContentsPay")
public class AjaxContentsPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("구매 요청 들어옴.");
		
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		int point = Integer.parseInt(request.getParameter("point"));
		
		// DAO 호출
		PayDAO pDao = new PayDAO();
		
		try {
			pDao.paymentAdd(id, subject, point);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
