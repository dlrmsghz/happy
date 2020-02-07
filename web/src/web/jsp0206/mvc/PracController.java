package web.jsp0206.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PracController extends HttpServlet{


	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 모든 요청이 이곳으로 돌어오니, uri 분석하여 요청에 따라 맞는 처리를 하고
		// 요청에 맞는 jsp 페이지 forward 시키자
	
		// #1. uri 분석
		String uri = request.getRequestURI();
		System.out.println("uri =====>" + uri);
		
		// #2. 각 uri 요청에 따른 처리
		String view = "";
		if(uri.equals("/web/prac.kun")) {
			view = "/class/jsp0206/pracForm.jsp";
		}else if(uri.equals("/web/pracPro.kun")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			// DB 연결처리
			int check = 1;
			request.setAttribute("check", check);
			view = "/class/jsp0206/pracPro.jsp";
			
		}  
		// http://localhost:8080/web/login.git
		//                      <-- uri------>
		//<--------------url----------------->
		
		// #3. 페이지 포워드
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		//request.getRequestDispatcher(view).forward(request,response); 굳이 변수 안만드려면 줄여서 이렇게
		
	
		
		
	}
	
}
