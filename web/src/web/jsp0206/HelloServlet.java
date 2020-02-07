package web.jsp0206;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/* static int x = 100; */

    public HelloServlet() {
        super();
        // 생성자.
    }
    
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
    	
		/*
		 * 	int y = 200; 
		 * 	System.out.println(HelloServlet.x); 
		 * 	System.out.println(y);
		 */
    	
    	PrintWriter pw= response.getWriter();
    	pw.println("<html>;");
    	pw.println("<body>;");
    	pw.println("<h2>HelloServlet!!!!</h2>;");
    	pw.println("</body>;");
    	pw.println("</html>;");
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.getParameter("id"); // jsp 에서  request 받은 걸 (매개변수 파라미터 받아오던것 자동으로 받아 오는 것임) 
		

		// GET 요청 받았을 때 처리해야 할 로직 작성	
			
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Post 요청 받았을 때 처리해야 할 로직 작성
		doGet(request, response);
	}

}