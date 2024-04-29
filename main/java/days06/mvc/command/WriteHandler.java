package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days06.mvc.domain.BoardDTO;
import days06.mvc.persistance.BoardDAOImpl;



public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		System.out.println(">>> " + method);
		if( method.equals("GET")) { // List.java doGet()
			return "/days06/board/write.jsp";
			
		}else {	// List.java doPost();
			System.out.println(">>> post.");
			request.setCharacterEncoding("UTF-8");
			String writer = request.getParameter("writer");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt( request.getParameter("tag") );
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
			
			BoardDTO dto = new BoardDTO(0, writer, pwd, email, title, null, 0, tag, content);
			int rowCount = 0;
			
			try {
				rowCount = daoImpl.insert(dto);
			} catch (SQLException e) {
				System.out.println(" > Write.doPost() 예외 발생");
				e.printStackTrace();
			}
			
			conn.close();
			
			// 리 다이렉팅
			// 리 다이렉팅 할때는 컨텍스트 패스부터 준다.
			String location = "/jspPro/board/list.do";
			location += rowCount == 1 ? "?write=success" : "write=fail";
			response.sendRedirect(location);
		}
		return null;
	}
	
	

}
