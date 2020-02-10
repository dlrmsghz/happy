package web.jsp0210.mvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.jsp0207.mvc.TestVO;

public class TestController1 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		
		request.setAttribute("day", new java.util.Date());
		
		request.getRequestDispatcher("/class/jsp0210/jstl02.jsp").forward(request, response);
		
		
		
		
		
		
		
					
	}
}
