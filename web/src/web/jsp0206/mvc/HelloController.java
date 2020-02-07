package web.jsp0206.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HelloController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		서블릿은 바로 실행이 불가. 요청과 맞물려 연결해줄 웹주소도 만들어 줘야함.
//		web.xml 에 작업해야 함.
		
//		super.service(req, resp);
		
		System.out.println("hello!!!!! controller!!");
		
		
//		# jsp 페이지에 데이터 넘기기
		request.setAttribute("num",1111);
		request.setAttribute("name","pikachu");  // 넘겼으니까 jsp 페이지 에서 꺼내지는지 안되는지 확인해보자  /class/jsp0206/hello.jsp 가서 확인
		
//		# session으로 데이터 넘기기
		HttpSession session = request.getSession(); // getSession 속성을 보면 HttpSession 타입 이니까  HttpSession 타입의 session 객체 생성해서 한번 담아줌  그리고 javax HTTP import 한다
		session.setAttribute("memId", "java1");
		
//		# 해당 JSP 페이지 연결
		RequestDispatcher rd = request.getRequestDispatcher("/class/jsp0206/hello.jsp");
				rd.forward(request, response);
		
// 		<jsp:forward> 태그를 자바로 바꾼 형태와 비슷
		
	}
}
