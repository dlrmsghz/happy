package web.jsp0207.mvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TestController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// #1. request 속성 추가
		request.setAttribute("name", 99);
		request.setAttribute("id", "java1");
		// #2. request null 값 보내기
		request.setAttribute("data", null);
		// #3. 문자형 숫자 보내서 숫자연산 확인
		request.setAttribute("age", 10);
		
		// #4. session 값 보내기
		HttpSession session =request.getSession();
		session.setAttribute("num", 777);
		session.setAttribute("memId", "java1");
		
		// #5. 배열 보내기
		int [] arr = {10, 20, 30, 40, 50};
		request.setAttribute("arr",arr);
		
		//#6. ArrayList 보내기
		/* ArrayList list = new ArrayList(); */ 
		/* List 타입으로 써줘야 자바의 기능을 더 써서 범용성을 넓힐수 있음 (List를 상속받아서 쓰면 더 많은걸 활용가능) */
		List list = new ArrayList();
		list.add("pikachu");
		list.add("Raichu");
		list.add("Chalemender");
		request.setAttribute("list", list);
		
		// #7. TestVO
		TestVO vo = new TestVO();
		
		vo.setId("java1");
		vo.setName("pickachu");
		vo.setAge(10);
		request.setAttribute("vo", vo);
		
		
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/class/jsp0207/test.jsp");
		rd.forward(request, response);
					
	}
}
