package web.jsp0206.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginProController extends HttpServlet{

		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
		/*
		 * DB 연결해서 id, pw 체크하는 로직... MemberDAO dao = MemberDAO.getInstance(); int check
		 * = dao.usercheck(id, pw);
		 */
		
			int check = 1; 	 // 임의로 맞다고 지정하기
		
			// view 에게 로그인 체크 결과를 request 로 저장해서 넘겨주기
			request.setAttribute("check",check);
			
			// 실제 보여줄 jsp 페이지 연걸
			RequestDispatcher rd = request.getRequestDispatcher("/class/jsp0206/loginPro.jsp");
			rd.forward(request, response);
			
			
			
		}
	
}
