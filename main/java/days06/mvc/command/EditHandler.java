package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days06.mvc.domain.BoardDTO;
import days06.mvc.persistance.BoardDAOImpl;



public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		System.out.println(">>> " + method);
		if( method.equals("GET")) { // List.java doGet()
			long pseq = Long.parseLong(request.getParameter("seq"));
			
			
			// [ 해당 글번호의 내용 가져오기 ]
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
			BoardDTO dto = null;
			
			try {
				dto = daoImpl.view(pseq);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(" > EditHandler.doGet()에서 예외 발생 ");
			}
			
			conn.close();
			
			// 1. 리스트값으로 전달
			request.setAttribute("dto", dto);
			return "/days06/board/edit.jsp";
			
		}else {	// List.java doPost();
			request.setCharacterEncoding("UTF-8");
			Long pseq = Long.parseLong(request.getParameter("seq"));
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt( request.getParameter("tag") );
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
			
			BoardDTO dto = new BoardDTO().builder()
					.seq(pseq)
					.pwd(pwd)
					.email(email)
					.title(title)
					.content(content)
					.tag(tag)
					.build();	
			
			
			int rowCount = 0;
			
			try {
				rowCount = daoImpl.update(dto);
			} catch (SQLException e) {
				System.out.println(" > EditHandler.doPost() 예외 발생");
				e.printStackTrace();
			}
			
			conn.close();
			
			// 리 다이렉팅
			// 리 다이렉팅 할때는 컨텍스트 패스부터 준다.
			String location = "/jspPro/board/view.do?seq="+pseq;
			location += rowCount == 1 ? "&edit=success" : "&edit=fail";
			response.sendRedirect(location);
			}
			
	
			
			
		return null;
	}
	
	

}
