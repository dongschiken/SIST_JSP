package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days06.mvc.domain.BoardDTO;
import days06.mvc.persistance.BoardDAOImpl;


// view 상세보기 => Model
public class ViewHandler implements CommandHandler {


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				// 검색 기능 + 페이징 처리
				// 글 목록보기에서 제목을 클릭해서 상세보기 seq= 일때는 조회수 증가
				// 수정하기에서 들어오면 seq= & edit= 일때는 조회수 증가 x
				// view.htm?seq=154
				long pseq = Long.parseLong(request.getParameter("seq"));
				
				
				Connection conn = ConnectionProvider.getConnection();
				BoardDAOImpl daoImpl = new BoardDAOImpl(conn);
				BoardDTO dto = null;
				
				try {
					if( request.getParameter("edit") == null) {
						daoImpl.increaseReaded(pseq);
					}
					dto = daoImpl.view(pseq);
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println(" > ViewHandler.process()에서 예외 발생 ");
				}
				
				conn.close();
				
				// 1. 리스트값으로 전달
				request.setAttribute("dto", dto);
				
				return "/days06/board/view.jsp"; // list.jsp;
	}


}
